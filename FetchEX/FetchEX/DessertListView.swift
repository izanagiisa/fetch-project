//
//  DessertListView.swift
//  FetchEX
//
//  Created by izanagiisa on 3/13/24.
//

import SwiftUI

struct DessertListView: View {
    @State var meals = [Meal]()
 
    var body: some View {
        VStack {
            NavigationStack {
                List(meals, id: \.idMeal) { meal in
                    NavigationLink(destination: DessertDetailView(dessert: meal)) {
                        MealRow(meal: meal)
                    }
                }
                .task {
                    await refreshList()
                }
                .refreshable {
                    Task { await refreshList() }
                }
                .toolbar {
                    Button("Reload") {
                        Task { await refreshList() }
                    }
                }
                .navigationTitle("Dessert List")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    private func refreshList() async {
        meals = (try? await NetworkingManager.fetchDessert()) ?? []
    }
}

#Preview {
    NavigationStack {
        DessertListView()
    }
}
