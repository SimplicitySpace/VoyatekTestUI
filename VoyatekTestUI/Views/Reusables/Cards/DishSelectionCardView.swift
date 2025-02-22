//
//  DishSelectionBox.swift
//  VoyatekTestUI
//
//  Created by Mac on 2/21/25.
//

import SwiftUI


import SwiftUI

struct DishSelectionCardView: View {
    @State private var selectedDish: String? = "All"
    
    let dishes = ["All","Morning Feast", "Sunshine Meal", "Dawn Delicacies", "Snacks", "Dessert"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(dishes, id: \.self) { dish in
                    DishTypeCardView(isSelected: .constant(selectedDish == dish), dish: dish)
                        .onTapGesture {
                            selectedDish = (selectedDish == dish) ? nil : dish
                        }
                }
            }
  
        }
    }
}

#Preview {
    DishSelectionCardView()
}
