//
//  SettingsScreen.swift
//  SwiftChat
//
//  Created by Freek Zijlmans on 16/08/2020.
//

import SwiftUI

struct SettingsScreen: View {
	@AppStorage("username") private var username = ""
	
	private var isUsernameValid: Bool {
		!username.trimmingCharacters(in: .whitespaces).isEmpty
	}
	
	var body: some View {
		Form {
			Section(header: Text("Username")) {
				TextField("E.g. John Applesheed", text: $username)

				NavigationLink("Continue", destination: ChatScreen())
					.disabled(!isUsernameValid)
			}
		}
		.navigationTitle("Settings")
	}
}
