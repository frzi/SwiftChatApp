//
//  File.swift
//  
//
//  Created by Freek Zijlmans on 15/08/2020.
//

import Foundation
import WebSocketKit

extension WebSocket: Hashable {
	public static func == (lhs: WebSocket, rhs: WebSocket) -> Bool {
		ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(ObjectIdentifier(self))
	}
}
