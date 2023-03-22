//
//  NewMessageViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by MacBook on 22.03.2023.
//

import Foundation
import SwiftUI
import Firebase

class NewMessageViewModel: ObservableObject {
@Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            
            self.users = documents.compactMap({ try? $0.data(as: User.self) }).filter({$0.id != AuthViewModel.shared.userSession?.uid})
        }
    }
}
