//
//  HomeTab.swift
//  VoyatekTestUI
//
//  Created by Mac on 2/21/25.
//

import SwiftUI

struct HomeTab: View {
    init() {
       
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home").font(.satoshi(weight: .medium, size: 14))
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Generator").font(.satoshi(weight: .medium, size: 14))
                }
            
            AddNewFood()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Add").font(.satoshi(weight: .medium, size: 14))
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorite").font(.satoshi(weight: .medium, size: 14))
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Planner").font(.satoshi(weight: .medium, size: 14))
                }
        }
        .accentColor(Color("kPrimary"))
    }
}

#Preview {
    HomeTab()
}



struct SearchView: View {
    var body: some View {
        Text("Search Screen").font(.satoshi(weight: .bold, size: 18))
    }
}

struct FavoritesView: View {
    var body: some View {
        Text("Favorites Screen").font(.satoshi(weight: .bold, size: 18))
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Screen").font(.satoshi(weight: .bold, size: 18))
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings Screen").font(.satoshi(weight: .bold, size: 18))
    }
}



enum CustomFontWeight: String {
    case black = "Black"
    case bold = "Bold"
    case medium = "Medium"
    case regular = "Regular"
    case light = "Light"
}

extension Font {
    static func satoshi(weight: CustomFontWeight = .regular, size: CGFloat = 18) -> Font {
        return .custom("Satoshi-\(weight.rawValue)", size: size)
    }
}

struct SatoshiTextModifier: ViewModifier {
    var weight: CustomFontWeight
    var size: CGFloat
    var color: Color = Color("text_color")

    func body(content: Content) -> some View {
        content
            .font(.satoshi(weight: weight, size: size))
            .foregroundColor(color)
    }
}

extension View {
    func satoshiText(weight: CustomFontWeight = .regular, size: CGFloat = 18, color: Color = .black) -> some View {
        self.modifier(SatoshiTextModifier(weight: weight, size: size, color: color))
    }
}

