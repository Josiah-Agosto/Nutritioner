//
//  CalendarViewHolder.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 12/4/20.
//

import SwiftUI

struct CalendarViewHolder: View {
    // MARK: - References / Properties
    @Environment(\.calendar) var calendar
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var selectedDateViewModel = SelectedDateViewModel()
    
    var body: some View {
        ScrollView {
            CalendarView(year) { date in
                Text("Per Day")
                    .hidden()
                    .padding(5)
                    .foregroundColor(Color(red: 170 / 255, green: 170 / 255, blue: 0.6))
                    .background(Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255))
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                    .overlay(Text(String(self.calendar.component(.day, from: date))))
                    .onTapGesture {
                        selectedDateViewModel.selectedDate = String.getInputedDate(date)
                        selectedDateViewModel.selectedFormattedDate = String.getInputedDateLongFormat(date)
                        selectedDateViewModel.showingSelectedDate.toggle()
                        selectedDateViewModel.fetchMealCells()
                    }
            }
            .background(Color.clear)
        }
        .padding(.bottom, 12)
        .background(Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255)).edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("Calendar", displayMode: .inline)
        .sheet(isPresented: $selectedDateViewModel.showingSelectedDate) {
            NavigationView {
                SelectedDateView()
            }
        }
        .navigationBarItems(leading:
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
            })
        )
    }
    
    // Full Year
    private var year: DateInterval {
        calendar.dateInterval(of: .year, for: Date())!
    }
}
