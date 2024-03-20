//
//  MealRow.swift
//  FetchEX
//
//  Created by izanagiisa on 3/13/24.
//

import SwiftUI

struct MealRow: View {
    var meal: Meal
    @State private var dessertImage: UIImage?
    
    var body: some View {
        HStack {
            if let dessertImage = dessertImage {
                Image(uiImage: dessertImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(5)
            } else {
                Image(systemName: "photo")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .background(Color(uiColor: .lightGray))
                    .cornerRadius(5)
            }
            Text(meal.strMeal ?? "")
            Spacer()
        }
        .task {
            await loadImage()
        }
    }
    
    private func loadImage() async {
        guard let strImgUrl = meal.strMealThumb else { return }
        dessertImage = await NetworkingManager.loadDessertImage(from: strImgUrl)
    }
}

#Preview {
    return MealRow(meal: Constants.SampleData.meal)
}
