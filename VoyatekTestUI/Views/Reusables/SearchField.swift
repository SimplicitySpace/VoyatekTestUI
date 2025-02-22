//
//  SearchField.swift
//  VoyatekTestUI
//
//  Created by Mac on 2/21/25.
//

import SwiftUI

struct SearchField: View {
    @State private var searchText: String = ""
    
    var body: some View {
        HStack {
            Image("search")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundStyle(Color("kNeutral"))
            
            TextField("Search foods...", text: $searchText)
                .font(.satoshi(weight: .light, size: 16))
             
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.vertical, 8)
            
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .frame(height: 58)
        .padding(.horizontal, 12)
        .background(Color(.systemGray6)) 
        .cornerRadius(4)
    
    }
}

#Preview {
    SearchField()
}
