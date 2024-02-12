//
//  PreviewProvider.swift
//  Threads
//
//  Created by Omkar Anarse on 11/02/24.
//

import SwiftUI

extension Preview {
    static var dev : DeveloperPreview{
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    let user = User(
        id: NSUUID().uuidString,
        email: "omkar@gmail.com",
        userName: "itzz_omiii__07", 
        fullName: "Omkar anarse"
    )
}
