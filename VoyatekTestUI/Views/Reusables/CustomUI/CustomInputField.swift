//
//  CustomInputField.swift
//  VoyatekTestUI
//
//  Created by Mac on 2/21/25.
//

import SwiftUI

struct CustomInputField: View {
    let label: String
    let placeholder: String
    var isMultiline: Bool = false
    var options: [String] = []
    
    
    @Binding var text: String
    @State private var internalShowPicker: Bool = false
    var showPicker: Binding<Bool>?
    
    private var isDropdown: Bool { !options.isEmpty }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.satoshi(weight: .medium, size: 12))
                .foregroundColor(Color("text_color"))
                .padding(.leading, 5)
            
            if isMultiline {
                TextEditor(text: $text)
                    .frame(height: 104)
                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(Color.gray.opacity(0.5)))
            } else if isDropdown {
                Button(action: {
                    if let showPicker = showPicker {
                        showPicker.wrappedValue = true
                    } else {
                        internalShowPicker = true
                    }
                }) {
                    HStack {
                        Text(text.isEmpty ? placeholder : text)
                            .foregroundColor(text.isEmpty ? .gray : .black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(Color("textfield_border")))
                }
                .sheet(isPresented: showPicker ?? $internalShowPicker) {
                    VStack {
                        Text("Select \(label)")
                            .font(.headline)
                            .padding()

                        Picker("Select \(label)", selection: $text) {
                            ForEach(options, id: \.self) { option in
                                Text(option).tag(option)
                            }
                        }
                        .pickerStyle(.wheel)

                        Button("Done") {
                            if let showPicker = showPicker {
                                showPicker.wrappedValue = false
                            } else {
                                internalShowPicker = false
                            }
                        }
                        .padding()
                    }
                    .presentationDetents([.fraction(0.3)])
                }
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(Color("textfield_border")))
                    .textInputAutocapitalization(.never)
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var selectedCategory = "Lunch"
        @State private var showPicker = false

        var body: some View {
            VStack {
                
                CustomInputField(
                    label: "Name",
                    placeholder: "Enter food name",
                    text: .constant("")
                )

          
                CustomInputField(
                    label: "Category",
                    placeholder: selectedCategory,
                    options: ["Breakfast", "Lunch", "Dinner"],
                    text: $selectedCategory,
                    showPicker: $showPicker
                )

  
                CustomInputField(
                    label: "Meal Type",
                    placeholder: "Select",
                    options: ["Veg", "Non-Veg", "Vegan"],
                    text: .constant("")
                )

                Button("Open Picker") { showPicker = true } 
                    .padding()
            }
            .padding()
        }
    }
    
    return PreviewWrapper()
}
