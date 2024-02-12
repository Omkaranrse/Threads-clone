//
//  ExploreView.swift
//  Threads
//
//  Created by Omkar Anarse on 10/02/24.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchtext : String = ""
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $searchtext, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
