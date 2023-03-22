//
//  Message.swift
//  SwiftUIChatTutorial
//
//  Created by MacBook on 18.03.2023.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
}
