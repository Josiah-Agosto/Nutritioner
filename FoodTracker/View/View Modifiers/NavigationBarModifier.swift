//
//  NavigationBarModifier.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/23/20.
//

import SwiftUI
import UIKit

struct NavigationBarModifier: ViewModifier {
    // Upon initialization
    init(backgroundColor: UIColor, tintColor: UIColor) {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithOpaqueBackground()
        barAppearance.backgroundColor = backgroundColor
        barAppearance.titleTextAttributes = [.foregroundColor: tintColor]
        barAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
        
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
        UINavigationBar.appearance().compactAppearance = barAppearance
        UINavigationBar.appearance().tintColor = tintColor
    }
    
    // View Modifier Protocol
    func body(content: Content) -> some View {
        content
      }
}


extension View {
    func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, tintColor: tintColor))
    }
}
