//
//  File.swift
//  
//
//  Created by Freek Zijlmans on 15/08/2020.
//

import Foundation

struct SubmittedChatMessage: Decodable {
	let message: String
	let user: String
	let userID: UUID
}

struct ReceivingChatMessage: Encodable, Identifiable {
	let date = Date()
	let id = UUID()
	let message: String
	let user: String
	let userID: UUID
}
