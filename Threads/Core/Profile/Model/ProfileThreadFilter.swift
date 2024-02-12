//
//  ProfileThreadFilter.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import Foundation

enum ProfileThreadFilter : Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
