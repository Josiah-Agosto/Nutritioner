//
//  Coordinator.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/30/20.
//

import UIKit

class Coordinator: NSObject, UITextViewDelegate, NSLayoutManagerDelegate {
    // MARK: - References / Properties
    weak var textView: UITextView?
    var dynamicHeightTextField: DynamicHeightTextField
    
    init(dynamicHeightTextField: DynamicHeightTextField) {
        self.dynamicHeightTextField = dynamicHeightTextField
    }
        
    func textViewDidChange(_ textView: UITextView) {
        self.dynamicHeightTextField.text = textView.text
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func layoutManager(_ layoutManager: NSLayoutManager, didCompleteLayoutFor textContainer: NSTextContainer?, atEnd layoutFinishedFlag: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let view = self?.textView else { return }
            let size = view.sizeThatFits(view.bounds.size)
            if self?.dynamicHeightTextField.height != size.height {
                self?.dynamicHeightTextField.height = size.height
            }
        }
    }
    
}
