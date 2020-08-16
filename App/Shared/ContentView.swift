//
//  ContentView.swift
//  Shared
//
//  Created by Freek Zijlmans on 15/08/2020.
//

import SwiftUI

struct ContentView: View {
	@StateObject private var userInfo = UserInfo()
	
    var body: some View {
		NavigationView {
			SettingsScreen()
		}
		.environmentObject(userInfo)
		.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
