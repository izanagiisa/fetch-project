//
//  Meal.swift
//  FetchEX
//
//  Created by izanagiisa on 3/13/24.
//

import Foundation


struct Meals: Codable {
    var meals: [Meal]
    
    private var filterMeals: [Meal] {
        meals.filter {
            $0.idMeal != nil && $0.strMeal != nil && $0.strMealThumb != nil
        }
    }
    
    var sortedMeals: [Meal] {
        filterMeals.sorted { $0.strMeal!.caseInsensitiveCompare($1.strMeal!) == .orderedAscending }
    }
}

struct Meal: Codable {
    var idMeal: String?
    var strMeal: String?
    var strMealThumb: String?
    
    enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strMealThumb
    }
    
    init(idMeal: String?, strMeal: String?, strMealThumb: String?) {
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let idMeal = try container.decodeIfPresent(String.self, forKey: .idMeal), !idMeal.isEmpty {
            self.idMeal = idMeal
        }
        if let strMeal = try container.decodeIfPresent(String.self, forKey: .strMeal), !strMeal.isEmpty {
            self.strMeal = strMeal
        }
        if let strMealThumb = try container.decodeIfPresent(String.self, forKey: .strMealThumb), !strMealThumb.isEmpty {
            self.strMealThumb = strMealThumb
        }
    }
}
