//
//  AuthViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by MacBook on 19.03.2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth
import UIKit

class AuthViewModel: NSObject, ObservableObject {
    // problem: when we have more instance, only 1 instance will have value for a tempUser
    // we need to change it to Environment object and not initialize it
    @Published var didAuthenticateUser = false
    // tempUser is for registration when there is still 1 step to go, userSession is set when they finish with the signupflow and, setting usersession takes them to the main view
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?
    private var tempCurrentUser: Firebase.User?
    
    // it is going to create just one instance because there is the keyword static
    static let shared = AuthViewModel()
    
    override init() {
        super.init()
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func register(withEmail email:String, password:String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Registration failed with error \(error.localizedDescription)")
            }
            
            guard let user = result?.user else { return }
            // saving current user
            self.tempCurrentUser = user
            
            let data: [String: Any] = ["email":email,
                                       "username": username,
                                       "fullname": fullname
            ]
            
            COLLECTION_USERS.document(user.uid).setData(data){ _ in
                print("DEBUG: Successfully updated user info in firestore ... ")
                
                self.didAuthenticateUser = true
                
            }
            
        }
    }
    
    func uploadProfileImage(_ image: UIImage){
        print("DEBUG: Upload profile image from view model...")
        guard let uid = tempCurrentUser?.uid else {return}
        // upload image
        ImageUploader.uploadImage(image: image) { imageUrl in
            //update user data
            COLLECTION_USERS.document(uid).updateData(["profileImageUrl" : imageUrl]) { _ in
                print("DEBUG profile image uploaded")
            }
        }
    }
    
    func login(withEmail email:String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Registration failed with error \(error.localizedDescription)")
            }
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func signout(){
        self.userSession = nil
        try? Auth.auth().signOut()
        print("DEBUG Signout")
    }
    
    func fetchUser(){
        guard let uid = userSession?.uid else {return}
        print("user uid \(uid)")
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            print(snapshot?.data())
            guard let user = try? snapshot?.data(as: User.self) else {return}
       print(user)
            self.currentUser = user
        }
    }
}
