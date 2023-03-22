//
//  ContentView.swift
//  SwiftUIChatTutorial
//
//  Created by MacBook on 10.03.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil{
                MainTabView()
            }else {
                LoginView()
            }
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
