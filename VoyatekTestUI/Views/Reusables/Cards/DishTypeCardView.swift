//
//  DishType.swift
//  VoyatekTestUI
//
//  Created by Mac on 2/21/25.
//

import SwiftUI

struct DishTypeCardView: View {
    @Binding var isSelected: Bool
    let dish: String
    
    var body: some View {
        VStack {
            Text(dish)
                .font(.satoshi(weight: isSelected ? .black : .light))
                .frame(minWidth: 60 ,minHeight: 42)
                .padding(.horizontal, 10)
                .foregroundStyle(isSelected ? Color.white : Color.black)
                .background(isSelected ? Color("kPrimary") : Color(.systemGray6))
                .cornerRadius(4)
        }
    }
}

#Preview {
    @Previewable @State var selected = true  ;
    return DishTypeCardView(isSelected: $selected, dish: "Morning Feast")
}
