import Foundation
import NIO
import Vapor

var env = try Environment.detect()
let app = Application(env)
//app.http.server.configuration.hostname = "0.0.0.0" // For external access.

defer {
	app.shutdown()
}

let decoder = JSONDecoder()
var clientConnections = Set<WebSocket>()

app.webSocket("chat") { req, client in
	client.pingInterval = .seconds(10)

	clientConnections.insert(client)
	
	client.onText { ws, text in
		do {
			// Test if we're actually getting a valid `ChatMessage`.
			guard let data = text.data(using: .utf8) else {
				return
			}

			let _ = try decoder.decode(ChatMessage.self, from: data)
			for connection in clientConnections {
				connection.send(text)
			}
		}
		catch {
			print("Incorrect message type.")
			print(error)
		}
	}
	
	client.onClose.whenComplete { _ in
		clientConnections.remove(client)
	}
}

try app.run()
