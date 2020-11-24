//
//  MainView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/20/20.
//

import SwiftUI
import UIKit

struct MainView: View {
    // MARK: - References / Properties
    var testData: [FoodCell] = [FoodCell(name: "Breakfast", notes: "Something could go here.", date: "".getCurrentTime(), calories: 100), FoodCell(name: "Breakfast", notes: "Something could go here.", date: "".getCurrentTime(), calories: 100), FoodCell(name: "Breakfast", notes: "Something could go here.", date: "".getCurrentTime(), calories: 100), FoodCell(name: "Breakfast", notes: "Something could go here.", date: "".getCurrentTime(), calories: 100)]

    init() {
        UITableView.appearance().backgroundColor = UIColor(red: 215 / 255, green: 215 / 255, blue: 219 / 255, alpha: 1.0)
        UITableViewCell.appearance().backgroundColor = UIColor.clear
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(testData) { foodCell in
                    FoodCellView(food: foodCell)
                        .listRowBackground(Color.clear)
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle(Text("August"), displayMode: .large)
            .navigationBarItems(trailing:
                Button(action: {
                    // Go to add view
                }, label: {
                    Image(systemName: "plus.circle")
                })
                .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
            )
        }
        .navigationBarColor(backgroundColor: UIColor(red: 58 / 255, green: 58 / 255, blue: 60 / 255, alpha: 1.0), tintColor: UIColor.white)
        .navigationBarTitleDisplayMode(.large)
        .edgesIgnoringSafeArea(.all)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
