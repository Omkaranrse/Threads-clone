//
//  ContentView.swift
//  Threads
//
//  Created by Omkar Anarse on 10/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                TabBarView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
