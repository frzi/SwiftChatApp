import Foundation
import NIO
import Vapor

var env = try Environment.detect()
let app = Application(env)
//app.http.server.configuration.hostname = "0.0.0.0" // For external access.

defer {
	app.shutdown()
}

var clientConnections = Set<WebSocket>()

app.webSocket("chat") { req, client in
	client.pingInterval = .seconds(10)

	clientConnections.insert(client)
	
	client.onClose.whenComplete { _ in
		clientConnections.remove(client)
	}
	
	client.onText { ws, text in
		do {
			guard let data = text.data(using: .utf8) else {
				return
			}

			let incomingMessage = try JSONDecoder().decode(SubmittedChatMessage.self, from: data)

			let outgoingMessage = ReceivingChatMessage(
				message: incomingMessage.message,
				user: incomingMessage.user,
				userID: incomingMessage.userID)
			
			let json = try JSONEncoder().encode(outgoingMessage)
			
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
