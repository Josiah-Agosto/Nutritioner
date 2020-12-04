//
//  CalendarView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 12/4/20.
//

import SwiftUI

struct CalendarView<DateView>: View where DateView: View {
    // MARK: - References / Properties
    @Environment(\.calendar) var calendar
    // Calendar Properties
    let interval: DateInterval
    let showHeaders: Bool
    let content: (Date) -> DateView
    
    init(_ interval: DateInterval, _ showHeaders: Bool = true, @ViewBuilder content: @escaping (Date) -> DateView) {
        self.interval = interval
        self.showHeaders = showHeaders
        self.content = content
    }
    
    // MARK: - Body
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
            ForEach(months, id: \.self) { month in
                Section(header: header(for: month)) {
                    ForEach(days(for: month), id: \.self) { date in
                        if calendar.isDate(date, equalTo: month, toGranularity: .month) {
                            content(date).id(date)
                        } else {
                            content(date).hidden()
                        }
                    } // Day Cell
                    .foregroundColor(Color(red: 170 / 255, green: 170 / 255, blue: 0.6))
                    .background(Color.clear)
                } // Section
            } // Month
        } // LazyVGrid
        .background(Color.clear)
    }
    
    private var months: [Date] {
        calendar.generateDates(inside: interval, matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0))
    }
    
    private func header(for month: Date) -> some View {
        let component = calendar.component(.month, from: month)
        let formatter = component == 1 ? DateFormatter.monthAndYear : .month
        
        return Group {
            if showHeaders {
                Text(formatter.string(from: month))
                    .font(.title)
                    .padding(8)
                    .foregroundColor(Color(red: 170 / 255, green: 170 / 255, blue: 0.6))
                    .background(Color.clear)
            }
        }
    }
    
    
    private func days(for month: Date) -> [Date] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: month), let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start), let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end) else { return [] }
        
        return calendar.generateDates(inside: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end), matching: DateComponents(hour: 0, minute: 0, second: 0))
    }
    
}
