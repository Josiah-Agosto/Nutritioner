//
//  CalorieCounterWidget.swift
//  CalorieCounterWidget
//
//  Created by Josiah Agosto on 12/18/20.
//

import WidgetKit
import SwiftUI

struct CalorieCounterProvider: TimelineProvider {
    // Previewing Purposes
    func placeholder(in context: Context) -> CalorieWidgetEntry {
        CalorieWidgetEntry(date: Date(), calories: 650, currentDay: "WEDNESDAY", mealCounter: 6)
    }

    // Preview of what will be shown when Widget is placed.
    func getSnapshot(in context: Context, completion: @escaping (CalorieWidgetEntry) -> ()) {
        let entry = CalorieWidgetEntry(date: Date(), calories: 650, currentDay: "WEDNESDAY", mealCounter: 6)
        completion(entry)
    }

    // The data that I want to present.
    func getTimeline(in context: Context, completion: @escaping (Timeline<CalorieWidgetEntry>) -> ()) {
        let currentDate = Date()
        let dayOffset = 1
        let entryDate = Calendar.current.date(byAdding: .minute, value: dayOffset, to: currentDate)!
        let entry = CalorieWidgetEntry(date: currentDate, calories: fetchMeals()["calories"] as! Int, currentDay: fetchMeals()["currentDay"] as! String, mealCounter: fetchMeals()["mealCounter"] as! Int)
        let timeline = Timeline(entries: [entry], policy: .after(entryDate))
        completion(timeline)
    }
    
    // Fetches App Group Property List Data.
    private func fetchMeals() -> [String: Any] {
        let groupUrl = FileManager.sharedContainerUrl().appendingPathComponent("WidgetData.plist")
        if let data = try? Data(contentsOf: groupUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] {
                print("Data: \(result)")
                return result
            }
        }
        return [:]
    }
    
}

// MARK: - Displayed View
struct CalorieWidgetView: View {
    var entry: CalorieCounterProvider.Entry
    
    var body: some View {
        VStack(spacing: 0) {
            Text(entry.currentDay)
                .padding(.top, 10)
                .font(.custom("HelveticaNeue", size: 20))
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Calories:")
                        .font(.custom("HelveticaNeue-Light", size: 11))
                    Text("\(entry.calories)")
                        .font(.custom("AvenirNext-Bold", size: 31))
                        .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
                    Text("Total Meals:")
                        .font(.custom("HelveticaNeue-Light", size: 11))
                    Text("\(entry.mealCounter)")
                        .font(.custom("AvenirNext-Bold", size: 31))
                        .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            .background(Color.clear)
        }
    }
}


@main
struct CalorieCounterWidget: Widget {
    let kind: String = "CalorieCounterWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CalorieCounterProvider()) { entry in
            CalorieWidgetView(entry: entry)
        }
        .configurationDisplayName("Calorie Counter Widget")
        .description("You will be able to see a summary of your calories for the day.")
        .supportedFamilies([.systemSmall])
    }
}


struct CalorieCounterWidget_Previews: PreviewProvider {
    static var previews: some View {
        CalorieWidgetView(entry: CalorieWidgetEntry(date: Date(), calories: 650, currentDay: "WEDNESDAY", mealCounter: 6))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}



// MARK: - File Manager Extension
extension FileManager {
    // Links container with this identifier
    static func sharedContainerUrl() -> URL {
        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.JosiahAgosto")!
    }
}
