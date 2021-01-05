//
//  WidgetManager.swift
//  Nutritioner
//
//  Created by Josiah Agosto on 1/4/21.
//

import Foundation

enum WidgetError: Error {
    case dataError
}

class WidgetManager {
    // MARK: - References / Properties
    public static let shared = WidgetManager()
    
    // Fetches App Group Property List Data.
    public func fetchMeals(_ completion: @escaping(Result<[String: Any], WidgetError>) -> ()) {
        let groupUrl = FileManager.sharedContainerUrl().appendingPathComponent("WidgetData.plist")
        if let data = try? Data(contentsOf: groupUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] {
                completion(.success(result))
            } else {
                completion(.failure(.dataError))
            }
        } else {
            completion(.failure(.dataError))
        }
    }
    
}
