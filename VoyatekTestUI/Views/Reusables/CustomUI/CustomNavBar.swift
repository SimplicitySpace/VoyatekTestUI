//
//  CustomNavBar.swift
//  VoyatekTestUI
//
//  Created by Mac on 2/21/25.
//


import SwiftUI

struct CustomNavBar: View {
    let title: String
    var onBack: (() -> Void)?
    
    var body: some View {
        HStack {
            Button(action: { onBack?() }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .padding()
            }
            Text(title)
                .font(.satoshi(weight: .light, size: 18))
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CustomNavBar(title: "Add  New Food", onBack: {})
}
