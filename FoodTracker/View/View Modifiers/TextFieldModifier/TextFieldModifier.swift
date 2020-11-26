//
//  TextFieldModifier.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/25/20.
//

import SwiftUI
import UIKit

struct TextFieldModifier: ViewModifier {
    init() {
        let textFieldAppearance = UITextField.appearance()
//        let bottomLine = CALayer()
        textFieldAppearance.font = UIFont(name: "Helvetica Neue", size: 20)
        textFieldAppearance.backgroundColor = UIColor(red: 215 / 255, green: 215 / 255, blue: 219 / 255, alpha: 1.0)
        textFieldAppearance.attributedPlaceholder = NSAttributedString(string: "", attributes: [.foregroundColor: UIColor(red: 170 / 255, green: 170 / 255, blue: 0.6, alpha: 1.0)])
        textFieldAppearance.textAlignment = .left
        textFieldAppearance.borderStyle = .none
//        bottomLine.frame = CGRect(x: 0.0, y: textFieldAppearance.frame.height - 1, width: textFieldAppearance.frame.width, height: 0.5)
//        bottomLine.backgroundColor = UIColor(red: 170 / 255, green: 170 / 255, blue: 0.6, alpha: 1.0).cgColor
//        textFieldAppearance.layer.addSublayer(bottomLine)
    }
    
    func body(content: Content) -> some View {
        content
    }
}


extension View {
    func customTextField() -> some View {
        self.modifier(TextFieldModifier())
    }
}
