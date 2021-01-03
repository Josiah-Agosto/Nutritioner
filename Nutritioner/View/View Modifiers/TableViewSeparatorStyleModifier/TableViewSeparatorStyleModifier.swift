//
//  TableViewSeparatorStyleModifier.swift
//  Nutritioner
//
//  Created by Josiah Agosto on 12/9/20.
//

import SwiftUI

struct TableViewSeparatorStyleModifier: ViewModifier {
    let style: UITableViewCell.SeparatorStyle
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                UITableView.appearance().separatorStyle = self.style
            }
    }
}



extension View {
    func listSeparatorStyle(style: UITableViewCell.SeparatorStyle) -> some View {
        ModifiedContent(content: self, modifier: TableViewSeparatorStyleModifier(style: style))
    }
}
