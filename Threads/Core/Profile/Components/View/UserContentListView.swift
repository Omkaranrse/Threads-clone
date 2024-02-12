//
//  UserContentListView.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import SwiftUI

struct UserContentListView: View {
    
    @StateObject var viewModel : UserContentListViewModel
    @State private var selectedFilter : ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var fliterBarWidth : CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    init(user: User){
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    
    var body: some View {
        VStack{
            HStack{
                ForEach(ProfileThreadFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundStyle(.black)
                                .frame(width: fliterBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: fliterBarWidth, height: 1)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedFilter = filter
                        }
                    }
                }
            }
            
            LazyVStack {
                ForEach(viewModel.threads) { thread in
                    ThreadCell(thread: thread)
                }
            }
        }
        .padding(.vertical, 8)
        .onAppear {
            Task{
                try await viewModel.fetchUserThreads()
            }
        }
    }
}

//#Preview {
//    UserContentListView(user: <#User#>)
//}
