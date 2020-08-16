//
//  ChatMessage.swift
//  SwiftChat
//
//  Created by Freek Zijlmans on 15/08/2020.
//

import Foundation

struct SubmittedChatMessage: Encodable {
	let message: String
	let user: String
	let userID: UUID
}

struct ReceivingChatMessage: Decodable, Identifiable {
	let date: Date
	let id: UUID
	let message: String
	let user: String
	let userID: UUID
}
