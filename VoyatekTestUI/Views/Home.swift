//
//  Home.swift
//  VoyatekTestUI
//
//  Created by Mac on 2/21/25.
//

import SwiftUI

struct Home: View {
    @State private var foodItems: [FoodItem] = []
    @State private var errorMessage: String?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ProfileHeader()
                SearchField()
                DishSelectionCardView()
                
                VStack(alignment: .leading) {
                    Text("All Foods").font(.satoshi())
                    
                    if let errorMessage = errorMessage {
                        Text("❌ Error: \(errorMessage)").foregroundColor(.red)
                    } else if foodItems.isEmpty {
                        HStack {
                            Spacer()
                            ProgressView("Loading...")
                            Spacer()
                        }

                    } else {
                        ForEach(foodItems, id: \.id) { food in
                            FoodCardView(
                                dishName: food.name,
                                calories: food.calories,
                                description: food.description,
                                tags:food.foodTags, 
                                imageName: food.foodImages.first?.imageUrl ?? "garlic_butter"
                            )
                        }

                    }
                }
                .padding(.vertical, 16)
                
                Spacer()
            }
            .onAppear {
                fetchFoodItems()
            }
            .padding(.horizontal, 16)
        }.edgesIgnoringSafeArea(.leading)
    }
    
    private func fetchFoodItems() {
        APIService.shared.fetchFoodItems { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let foods):
                    self.foodItems = foods
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

#Preview() {
    Home()
}
