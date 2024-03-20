//
//  Dessert.swift
//  FetchEX
//
//  Created by izanagiisa on 3/13/24.
//

import Foundation

struct Dessert: Codable {
    let meals: [Detail]
}

struct Detail: Codable {
    let strInstructions: String?
    var strIngredient1, strIngredient2, strIngredient3,
        strIngredient4, strIngredient5, strIngredient6,
        strIngredient7, strIngredient8, strIngredient9,
        strIngredient10, strIngredient11, strIngredient12,
        strIngredient13, strIngredient14, strIngredient15,
        strIngredient16, strIngredient17, strIngredient18,
        strIngredient19, strIngredient20: String?
    var strMeasure1, strMeasure2, strMeasure3,
        strMeasure4, strMeasure5, strMeasure6,
        strMeasure7, strMeasure8, strMeasure9,
        strMeasure10, strMeasure11, strMeasure12,
        strMeasure13, strMeasure14, strMeasure15,
        strMeasure16, strMeasure17, strMeasure18,
        strMeasure19, strMeasure20: String?
    var strIngredients = [String]()
    var strMeasures = [String]()
    var ingredientsMeasures = [String]()

    enum CoodingKeys: String, CodingKey {
        case strInstructions
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.strInstructions = try container.decodeIfPresent(String.self, forKey: .strInstructions)
        
        let ingredientKeys: [CodingKeys] = [.strIngredient1, .strIngredient2, .strIngredient3,
                                                .strIngredient4, .strIngredient5, .strIngredient6,
                                                .strIngredient7, .strIngredient8, .strIngredient9,
                                                .strIngredient10, .strIngredient11, .strIngredient12,
                                                .strIngredient13, .strIngredient14, .strIngredient15,
                                                .strIngredient16, .strIngredient17, .strIngredient18,
                                                .strIngredient19, .strIngredient20]
        for key in ingredientKeys {
            if let value = try container.decodeIfPresent(String.self, forKey: key),!value.isEmpty {
                self.strIngredients.append(value)
            }
        }
        
        let measureKeys: [CodingKeys] = [.strMeasure1, .strMeasure2, .strMeasure3,
                                            .strMeasure4, .strMeasure5, .strMeasure6,
                                            .strMeasure7, .strMeasure8, .strMeasure9,
                                            .strMeasure10, .strMeasure11, .strMeasure12,
                                            .strMeasure13, .strMeasure14, .strMeasure15,
                                            .strMeasure16, .strMeasure17, .strMeasure18,
                                            .strMeasure19, .strMeasure20]
        for key in measureKeys {
            if let value = try container.decodeIfPresent(String.self, forKey: key), !value.isEmpty {
                self.strMeasures.append(value)
            }
        }
        
        self.ingredientsMeasures = zip(self.strIngredients, self.strMeasures).map { "\($0): \($1)" }
    }
}
