//
//  UserInfo.swift
//  SwiftChat
//
//  Created by Freek Zijlmans on 16/08/2020.
//

import Combine
import Foundation

class UserInfo: ObservableObject {
	let userID = UUID()
	@Published var username = ""
}
