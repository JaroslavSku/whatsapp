//
//  ImagePicker.swift
//  SwiftUIChatTutorial
//
//  Created by MacBook on 17.03.2023.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
   
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        //important line will not work without this line
        picker.delegate = context.coordinator

        return picker
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {

            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            print("before updaing image")
            guard let image = info[.originalImage] as? UIImage else {return}
            print("updating image")
            self.parent.image = image
            //close after selecting a pick
            self.parent.mode.wrappedValue.dismiss()
        }
        
    }

}
