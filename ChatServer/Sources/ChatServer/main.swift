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
let encoder = JSONEncoder()
var clientConnections = Set<WebSocket>()

app.webSocket("chat") { req, client in
	client.pingInterval = .seconds(10)

	clientConnections.insert(client)
	
	client.onClose.whenComplete { _ in
		print("Disconnected:", client)
		clientConnections.remove(client)
	}
	
	client.onText { ws, text in
		do {
			guard let data = text.data(using: .utf8) else {
				return
			}

			let incomingMessage = try decoder.decode(SubmittedChatMessage.self, from: data)

			let outgoingMessage = ReceivingChatMessage(
				message: incomingMessage.message,
				user: incomingMessage.user,
				userID: incomingMessage.userID)
			
			let json = try encoder.encode(outgoingMessage)
			
			guard let jsonString = String(data: json, encoding: .utf8) else {
				return
			}

			for connection in clientConnections {
				connection.send(jsonString)
			}
		}
		catch {
			print(error)
		}
	}
}

try app.run()
