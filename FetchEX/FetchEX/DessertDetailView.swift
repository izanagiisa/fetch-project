//
//  DessertDetailView.swift
//  FetchEX
//
//  Created by izanagiisa on 3/13/24.
//

import SwiftUI

struct DessertDetailView: View {
    @State private var detail: Detail?
    @State private var instructions = ""
    @State private var ingredientsMeasures = [String]()
    @State private var dessertImage: UIImage?
    var dessert: Meal

    var body: some View {
        List {
            Section(footer: Text("ID: \(dessert.idMeal ?? "")").frame(maxWidth: .infinity, alignment: .trailing))
            {
                DessertImageRow(dessert: dessert)
            }
            .listRowBackground(Color.clear)
            Section(header: Text("Instructions").font(.subheadline).bold()) {
                Text(instructions)
            }
            Section(header: Text("Ingredients").font(.subheadline).bold()) {
                ForEach(ingredientsMeasures, id: \.self) { ingredientsMeasure in
                    Text(ingredientsMeasure).italic()
                }
            }
        }
        .navigationTitle(dessert.strMeal ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await loadDetails()
        }
    }
    
    private func loadDetails() async {
        do {
            guard let idMeal = dessert.idMeal else { return }
            detail = try await NetworkingManager.fetchDessertDetails(idMeal: idMeal)
            guard let detail = detail else { return }
            instructions = detail.strInstructions ?? ""
            ingredientsMeasures = detail.ingredientsMeasures
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    NavigationStack {
        return DessertDetailView(dessert: Constants.SampleData.meal)
    }
}
