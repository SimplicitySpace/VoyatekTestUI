//
//  FoodItem.swift
//  VoyatekTestUI
//
//  Created by Mac on 2/21/25.
//


import Foundation

struct APIResponse: Codable {
    let status: String
    let message: String
    let data: [FoodItem]  
}

struct FoodItem: Codable {
    let id: Int
    let name: String
    let description: String
    let categoryId: Int
    let calories: Int
    let createdAt: String
    let updatedAt: String
    let foodTags: [String]
    let foodImages: [FoodImage]
    let category: Category
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, calories, foodTags, foodImages, category
        case categoryId = "category_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct FoodImage: Codable {
    let id: Int
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "image_url"
    }
}

struct Category: Codable {
    let id: Int
    let name: String
    let description: String
}
