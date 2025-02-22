//
//  PhotoOption.swift
//  VoyatekTestUI
//
//  Created by Mac on 2/21/25.
//

import SwiftUI

struct PhotoOption: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 10) {
                Image(systemName: icon)
                    .font(.system(size: 26))
                    .foregroundColor(.gray)
                
                Text(title)
                    .font(.satoshi(weight: .medium, size: 14))
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, minHeight: 80)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("frame_border")))
        }
    }
}

#Preview {
    PhotoOption(icon: "", title: "", action: {})
}
