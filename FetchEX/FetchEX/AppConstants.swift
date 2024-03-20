//
//  AppConstants.swift
//  FetchEX
//
//  Created by izanagiisa on 3/13/24.
//

import Foundation

struct Constants {
    struct API {
        static let dessertListUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        static let dessertDetailUrl = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    }
    
    struct SampleData {
        static let meal = Meal(idMeal: "53049", strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    }
}
