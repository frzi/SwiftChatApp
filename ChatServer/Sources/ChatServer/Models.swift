//
//  File.swift
//  
//
//  Created by Freek Zijlmans on 15/08/2020.
//

import Foundation

struct ChatMessage: Codable, Identifiable {
	private(set) var id = UUID()
	private(set) var date = Date()
	let message: String
	let user: String
	let userID: String
}
