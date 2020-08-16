//
//  ContentView.swift
//  Shared
//
//  Created by Freek Zijlmans on 15/08/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationView {
			SettingsScreen()
		}
		.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
