//
//  MainView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/20/20.
//

import SwiftUI
import UIKit
import Combine

struct MainView: View {
    // MARK: - References / Properties
    // View Models
    @ObservedObject var mainViewModel = MainViewViewModel()
    @ObservedObject var addMealViewModel = AddMealViewModel()
    @State var showingNewFood: Bool = false

    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = UIColor.clear
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255).edgesIgnoringSafeArea(.all)
                List {
                    ForEach(mainViewModel.mealCellData, id: \.self) { mealCell in
                        NavigationLink(destination: SelectedMealView(food: mealCell)) {
                            FoodCellView(food: mealCell)
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                                .border(Color(red: 224 / 255, green: 224 / 255, blue: 226 / 255), width: 0.1)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .environment(\.defaultMinListRowHeight, 80)
                .navigationBarItems(trailing:
                    Button(action: {
                        showingNewFood.toggle()
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 27))
                            .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                    })
                )
                NavigationLink(destination: AddMealView(viewModel: addMealViewModel), isActive: $showingNewFood, label: { })
            }
            .navigationBarTitle(Text("August"), displayMode: .large)
        }
        .navigationBarColor(backgroundColor: UIColor(red: 215 / 255, green: 215 / 255, blue: 219 / 255, alpha: 1.0), tintColor: UIColor(red: 170 / 255, green: 170 / 255, blue: 170 / 255, alpha: 1.0))
        .edgesIgnoringSafeArea(.all)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
