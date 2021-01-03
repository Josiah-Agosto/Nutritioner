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
        CalorieWidgetEntry(date: Date(), calories: 650, currentDay: "WEDNESDAY", mealCounter: 6, latestMeal: LatestMeal(mealTitle: "Chicken Salad", mealTime: "12:15PM", mealCalories: "105"))
    }

    // Preview of what will be shown when Widget is placed.
    func getSnapshot(in context: Context, completion: @escaping (CalorieWidgetEntry) -> ()) {
        let entry = CalorieWidgetEntry(date: Date(), calories: 1792, currentDay: "WEDNESDAY", mealCounter: 8, latestMeal: LatestMeal(mealTitle: "Chicken Salad", mealTime: "12:15PM", mealCalories: "105"))
        completion(entry)
    }

    // The data that I want to present.
    func getTimeline(in context: Context, completion: @escaping (Timeline<CalorieWidgetEntry>) -> ()) {
        let mealFetch = fetchMeals()
        let latestMealFetch = mealFetch["latestMeal"] as! [String: String]
        let currentDate = Date()
        let dayOffset = 1
        let entryDate = Calendar.current.date(byAdding: .hour, value: dayOffset, to: currentDate)!
        let entry = CalorieWidgetEntry(date: currentDate, calories: mealFetch["calories"] as! Int, currentDay: mealFetch["currentDay"] as! String, mealCounter: mealFetch["mealCounter"] as! Int, latestMeal: LatestMeal(mealTitle: latestMealFetch["mealTitle"] ?? "", mealTime: latestMealFetch["mealTime"] ?? "", mealCalories: latestMealFetch["mealCalories"] ?? ""))
        let timeline = Timeline(entries: [entry], policy: .after(entryDate))
        completion(timeline)
    }
    
    // Fetches App Group Property List Data.
    private func fetchMeals() -> [String: Any] {
        let groupUrl = FileManager.sharedContainerUrl().appendingPathComponent("WidgetData.plist")
        if let data = try? Data(contentsOf: groupUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] {
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
        VStack(alignment: .center ,spacing: 0) {
            Text(entry.currentDay)
                .padding(.top, 10)
                .font(.custom("HelveticaNeue", size: 18))
            VStack(alignment: .center, spacing: 0) {
                HStack(alignment: .center, spacing: 0) {
                    Spacer()
                    VStack(alignment: .center, spacing: 0) {
                        Text("Calories:")
                            .font(.custom("HelveticaNeue-Light", size: 10))
                        Text("\(entry.calories)")
                            .font(.custom("AvenirNext-Bold", size: 28))
                            .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
                    }
                    Spacer()
                    VStack(alignment: .center, spacing: 0) {
                        Text("Meals:")
                            .font(.custom("HelveticaNeue-Light", size: 10))
                        Text("\(entry.mealCounter)")
                            .font(.custom("AvenirNext-Bold", size: 28))
                            .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
                    }
                    Spacer()
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .background(Color.clear)
            VStack(alignment: .center, spacing: 0) {
                Text("Latest Meal:")
                    .font(.custom("HelveticaNeue-Light", size: 10))
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(entry.latestMeal.mealTime)
                            .font(.custom("AvenirNext-Light", size: 8))
                            .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
                        Text(entry.latestMeal.mealTitle)
                            .font(.custom("AvenirNext-Medium", size: 14))
                            .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
                    }
                    .frame(alignment: .leading)
                    Spacer()
                    Text(entry.latestMeal.mealCalories)
                        .font(.custom("AvenirNext-SemiBold", size: 15))
                        .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 5, trailing: 8))
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
        CalorieWidgetView(entry: CalorieWidgetEntry(date: Date(), calories: 650, currentDay: "WEDNESDAY", mealCounter: 6, latestMeal: LatestMeal(mealTitle: "Chicken Salad", mealTime: "12:15PM", mealCalories: "105")))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}



// MARK: - File Manager Extension
extension FileManager {
    // Links container with this identifier
    static func sharedContainerUrl() -> URL {
        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.JosiahAgosto.Nutritioner.CalorieCounterWidget")!
    }
}
