//
//  AddNewFood.swift
//  VoyatekTestUI
//
//  Created by Mac on 2/21/25.
//

import SwiftUI

struct AddNewFood: View {
    @State private var name = ""
    @State private var description = ""
    @State private var category = ""
    @State private var calories = ""
    @State private var tags = ""
    @State private var showPicker = false
    @State private var isSubmitting = false
    @State private var errorMessage: String?
    @State private var successMessage: String?
    
    var isFormValid: Bool {
        !name.isEmpty && !description.isEmpty && !category.isEmpty && !calories.isEmpty && !tags.isEmpty
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
     
                
                TakePhotoView()
                
                CustomInputField(label: "Name", placeholder: "Enter food name", text: $name)
                CustomInputField(label: "Description", placeholder: "Enter food description", isMultiline: true, text: $description)
                CustomInputField(label: "Category", placeholder: "Select a category", options: ["Morning Feast", "Sunshine Meal", "Dawn Delicacies", "Snacks", "Dessert"], text: $category, showPicker: $showPicker)
                CustomInputField(label: "Calories", placeholder: "Enter number of calories", text: $calories).keyboardType(.decimalPad)
                CustomInputField(label: "Tags", placeholder: "Add a tag", text: $tags)
                
                if let errorMessage = errorMessage {
                    Text("❌ \(errorMessage)").foregroundColor(.red)
                }
                
                if let successMessage = successMessage {
                    Text("✅ \(successMessage)").foregroundColor(.green)
                }
                
                Spacer()
                
                CustomButton(title: isSubmitting ? "Adding..." : "Add Food",
                             isDisabled: !isFormValid || isSubmitting,
                             action: submitForm)
            }
            .padding(.horizontal, 16)
        }
    }
    
    private func submitForm() {



        let categoryMapping: [String: Int] = [
            "Morning Feast": 1,
            "Sunshine Meal": 2,
            "Dawn Delicacies": 3,
            "Snacks": 4,
            "Dessert": 5
        ]
        
        guard let categoryId = categoryMapping[category] else {
            errorMessage = "Invalid category selected"
            return
        }

        let tagIDs = tags.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        let tagStrings = tagIDs.map { String($0) } 

        let newFood: [String: Any] = [
            "name": name,
            "description": description,
            "category_id": categoryId,
            "calories": calories,
            "tags": tagStrings,
            "images": ["https://media.istockphoto.com/id/1457433817/photo/group-of-healthy-food-for-flexitarian-diet.jpg?s=612x612&w=0&k=20&c=v48RE0ZNWpMZOlSp13KdF1yFDmidorO2pZTu2Idmd3M="]
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: newFood) else {
            errorMessage = "Failed to encode request"
            return
        }

        isSubmitting = true
        errorMessage = nil
        successMessage = nil

        APIService.shared.postFoodItem(jsonData: jsonData) { result in
            DispatchQueue.main.async {
                isSubmitting = false
                switch result {
                case .success:
                    successMessage = "Food added successfully!"
                    clearForm()
                case .failure(let error):
                    errorMessage = "Failed to add food: \(error.localizedDescription)"
                }
            }
        }
    }




    
    private func clearForm() {
        name = ""
        description = ""
        category = ""
        calories = ""
        tags = ""
    }
}

#Preview {
    AddNewFood()
}
