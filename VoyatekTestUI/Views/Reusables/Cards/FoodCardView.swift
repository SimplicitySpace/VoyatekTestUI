//
//  FoodCardView.swift
//  VoyatekTestUI
//
//  Created by Mac on 2/21/25.
//

import SwiftUI

struct FoodCardView: View {
    let dishName: String
    let calories: Int
    let description: String
    let tags: [String]
    let imageName: String
    @State private var isFavorite = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, minHeight: 137, maxHeight: 137)
                
                
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(dishName)
                        .font(.satoshi(weight: .bold, size: 18))
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: { isFavorite.toggle() }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red : .gray)
                            .padding(10)
                    }
                }.padding(.bottom, 2)
                
                HStack(spacing: 4) {
                    Image("flames")
                        .resizable()
                        .frame(width: 11, height: 13.5)
                    Text("\(calories) Calories")
                        .font(.satoshi(weight: .medium, size: 12))
                        .foregroundColor(.black.opacity(0.8))
                }.padding(.bottom, 2)
                
                Text(description)
                    .font(.satoshi(weight: .regular, size: 14))
                    .lineLimit(4)
                        .truncationMode(.tail)
                    .foregroundColor(.gray)
                    .padding(.top, 6)
                    .fixedSize(horizontal: false, vertical: true) 
                
                HStack {
                    ForEach(tags, id: \.self) { tag in
                        Text(tag)
                            .font(.satoshi(weight: .medium, size: 12))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color("Ktag_bg"))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }.padding(.top, 8)
            }
            
            .padding(.bottom, 12)
            .padding(.horizontal, 16)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        
    }
}

#Preview {
    FoodCardView(
        dishName: "Garlic Butter Shrimp Pasta",
        calories: 320,
        description: "Creamy hummus spread on whole grain toast topped with sliced cucumbers and radishes.",
        tags: ["healthy", "vegetarian"],
        imageName: "garlic_butter"
    )
}
