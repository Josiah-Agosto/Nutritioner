//
//  KeyboardManager.swift
//  Nutritioner
//
//  Created by Josiah Agosto on 12/14/20.
//

import Foundation
import SwiftUI

class KeyboardManager: ObservableObject {
    // MARK: - References / Properties
    @Published var currentHeight: CGFloat = 0
    private var notificationCenter: NotificationCenter
    
    init(center: NotificationCenter = .default) {
        notificationCenter = center
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Methods
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            withAnimation {
                currentHeight = keyboardSize.height
            }
        }
    }
    
    ///
    @objc func keyboardWillHide(_ notification: Notification) {
        withAnimation {
            currentHeight = 0
        }
    }
    
}
