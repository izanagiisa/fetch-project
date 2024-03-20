//
//  NetwrokingManager.swift
//  FetchEX
//
//  Created by izanagiisa on 3/13/24.
//

import Foundation
import UIKit

class NetworkingManager {
    static private func fetchDessertImage(from url: URL) async throws -> UIImage {
        let imageDownloader = ImageDownloader()
        let image = try await imageDownloader.downloadImage(from: url)
        return image
    }
    
    static func loadDessertImage(from url: String) async -> UIImage? {
        return (try? await fetchDessertImage(from: URL(string: url)!)) ?? nil
    }
    
    static func fetchDessert() async throws -> [Meal] {
        let (data, _) = try await URLSession.shared.data(from: URL(string: Constants.API.dessertListUrl)!)
        let meals = try JSONDecoder().decode(Meals.self, from: data).sortedMeals
        return meals
    }
    
    static func fetchDessertDetails(idMeal: String) async throws -> Detail? {
        let url = URL(string: Constants.API.dessertDetailUrl + idMeal)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let details = try JSONDecoder().decode(Dessert.self, from: data).meals.first ?? nil
        return details
    }
}
