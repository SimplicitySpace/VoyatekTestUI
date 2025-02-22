//
//  ProfileHeader.swift
//  VoyatekTestUI
//
//  Created by Mac on 2/21/25.
//

import SwiftUI


struct ProfileHeader : View {
    var body: some View {
        HStack {
            VStack(alignment: .leading)  {
                Image("user_avatar")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text("Hey there, Lucy")
                        .font(.satoshi(weight: .black))
                    Text("Are you excited to create a tasty dish today?")
                        .font(.satoshi(weight: .light, size: 14)).foregroundColor(Color("WhiteDisabledText")
                        )
                    
                }
                
            }
            Spacer()
            Image(systemName: "bell")
                .resizable()
                .frame(width: 20, height: 20)
                .clipShape(Circle())
        }
    }
}

#Preview {
    ProfileHeader()
}


