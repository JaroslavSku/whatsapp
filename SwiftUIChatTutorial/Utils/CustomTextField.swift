//
//  CustomTextField.swift
//  SwiftUIChatTutorial
//
//  Created by MacBook on 15.03.2023.
//

import Foundation
import SwiftUI
struct CustomTextField: View {
    @Binding var text: String
    let imageName: String
    let placeholderText: String
    let isSecureField: Bool
    var body: some View {
        VStack{
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField {
                    TextField( placeholderText, text: $text)
                }else {
                    TextField("Email", text: $text)
                }
            }
        }
    }
}
