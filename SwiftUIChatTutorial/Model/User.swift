//
//  User.swift
//  SwiftUIChatTutorial
//
//  Created by MacBook on 20.03.2023.
//

import Foundation
import FirebaseFirestoreSwift
// decodable protocol you need to match db data directly and then its converted into a dictionary
struct User: Identifiable, Decodable {
    @DocumentID var id: String? // we get the id of the snapshot with the documentid and set it here
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}

let MOCK_USER = User(id:"12345678", username: "Test", fullname: "test", email: "test@gmail.com", profileImageUrl: "www.google.com")
