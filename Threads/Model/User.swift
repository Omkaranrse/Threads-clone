//
//  Modle.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let email: String
    let userName: String
    let fullName: String
    var profileImageUrl: String?
    var bio: String?
}
