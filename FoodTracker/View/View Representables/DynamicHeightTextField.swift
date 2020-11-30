//
//  DynamicHeightTextField.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/30/20.
//

import UIKit
import SwiftUI

struct DynamicHeightTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var height: CGFloat
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.isScrollEnabled = true
        textView.alwaysBounceVertical = false
        textView.text = text
        textView.backgroundColor = UIColor.clear
        textView.textColor = UIColor(red: 170 / 255, green: 170 / 255, blue: 170 / 255, alpha: 1.0)
        
        context.coordinator.textView = textView
        textView.delegate = context.coordinator
        textView.layoutManager.delegate = context.coordinator
        
        return textView
    }
    
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(dynamicHeightTextField: self)
    }
}
