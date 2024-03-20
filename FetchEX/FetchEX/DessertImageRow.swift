//
//  DessertImageRow.swift
//  FetchEX
//
//  Created by izanagiisa on 3/13/24.
//

import SwiftUI

struct DessertImageRow: View {
    var dessert: Meal
    @State private var dessertImage: UIImage?

    var body: some View {
        HStack {
            Spacer()
            if let dessertImage = dessertImage {
                Image(uiImage: dessertImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 300, maxHeight: 300)
                    .clipShape(.rect(cornerRadius: 5))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 3))
                
            } else {
                Image(systemName: "photo")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .background(Color(uiColor: .lightGray))
                    .cornerRadius(5)
            }
            Spacer()
        }
        .task {
            await loadImage()
        }
    }
    
    private func loadImage() async {
        guard let strImgUrl = dessert.strMealThumb else { return }
        dessertImage = await NetworkingManager.loadDessertImage(from: strImgUrl)
    }
}

#Preview {
    return DessertImageRow(dessert: Constants.SampleData.meal)
}
