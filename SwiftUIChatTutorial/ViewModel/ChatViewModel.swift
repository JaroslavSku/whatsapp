//
//  ChatViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by MacBook on 18.03.2023.
//

import Foundation

class ChatViewModel: ObservableObject{
    
    @Published var messages = [Message]()
    
    init() {
//        messages = mockMessages
    }
    
//    var mockMessages: [Message]{
//        [
//            .init(isFromCurrentUser: true, messageText: "Hey whats up man"),
//            .init(isFromCurrentUser: false, messageText: "Not much how are you"),
//            .init(isFromCurrentUser: true, messageText: "Im doing fine, having fun building."),
//            .init(isFromCurrentUser: true, messageText: "Are you learning alot?"),
//            .init(isFromCurrentUser: true, messageText: "Yeah i am i love this course"),
//            .init(isFromCurrentUser: true, messageText: "Thats awesome, im glad i bought it"),
//            .init(isFromCurrentUser: true, messageText: "Talk to you later!"),
//        ]
//    }
    
    func sendMessage(_ messageText: String) {
//        messages.append(Message(isFromCurrentUser: true, messageText: messageText))
        
    }
}
