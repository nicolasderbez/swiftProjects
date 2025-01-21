//
//  ContentView.swift
//  unitConvertor
//
//  Created by Nicolás Derbez on 18/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput: Double = 0.0
    @State private var selectedInput: String = "kg"
    @State private var units = ["Kg", "Lb", "Plates"]
    @State private var selectedOutput: String = "lb"
    
    var equivalence: Double{
        var result: Double = 0.0
        switch selectedInput{
        case "Kg":
            switch selectedOutput{
            case "Kg":
                result = userInput
            case "Lb":
                result = userInput * 2.20462
            case "Plates":
                result = userInput / 20
            default:
                result = userInput
            }
            
        case "Lb":
            switch selectedOutput{
            case "Kg":
                result = userInput / 2.20462
            case "Lb":
                result = userInput
            case "Plates":
                result = userInput / 45
            default:
                result = userInput
            }
        
        case "Plates":
            switch selectedOutput{
            case "Kg":
            result = userInput * 20
        case "Lb":
            result = userInput * 45
        case "Plates":
            result = userInput
        default:
            result = userInput
            }
        default:
            result = userInput
        }
        
        return result
    }
    
    var body: some View {
        Text("Calculate your bar weight")
        
        Form{
            Section("Weight"){
                
                Picker("Units", selection: $selectedInput){
                    ForEach(units, id: \.self){
                        Text($0)
                    }
                }
                TextField("Weight", value: $userInput, format: .number)
            }
            .keyboardType(.decimalPad)
            .pickerStyle(.segmented)
            
            Section("Equals..."){
                Picker("Units", selection: $selectedOutput){
                    ForEach(units, id: \.self){
                        Text($0)
                    }
                    
                }.pickerStyle(.segmented)
                Text(equivalence, format: .number)
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
