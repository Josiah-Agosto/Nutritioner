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
    
    var body: some View {
        ScrollView {
            CalendarView(year) { date in
                Text("Day")
                    .hidden()
                    .padding(8)
                    .background(Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255))
                    .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                    .clipShape(Circle())
                    .overlay(Text(String(self.calendar.component(.day, from: date))))
            }

        }
        .background(Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255))
        .navigationBarTitle("Calendar", displayMode: .inline)
    }
    
    private var year: DateInterval {
        calendar.dateInterval(of: .year, for: Date())!
    }
}
