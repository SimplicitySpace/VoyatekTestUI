//
//  CustomButton.swift
//  VoyatekTestUI
//
//  Created by Mac on 2/21/25.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    var isDisabled: Bool = false
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.satoshi(weight: .black, size: 14))
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(isDisabled ? Color.gray.opacity(0.3) : Color.blue)
                .foregroundColor(isDisabled ? .gray : .white)
                .cornerRadius(4)
           
        }
        .disabled(isDisabled)
    }
}

#Preview {
    VStack {
      
        CustomButton(title: "Add food", action: {})
    }
    .padding()
}
