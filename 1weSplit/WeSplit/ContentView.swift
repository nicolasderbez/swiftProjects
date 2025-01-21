//
//  ContentView.swift
//  WeSplit
//
//  Created by Nicolás Derbez on 17/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2 //the array index, not the number displayed
    @State private var tipPercentage = 15
    @FocusState private var amountIsFocused: Bool
    
    
    let tipPercentages = [0, 10, 15, 20]
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountperPerson = grandTotal / peopleCount
        
        return amountperPerson
    }
    
    var totalBill: Double{
        let tipSelection = Double(tipPercentage)
        
        return checkAmount * (1.0 + tipSelection/100)
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format : .currency(code: Locale.current.currency?.identifier ?? "MXN"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much do you want to tip?"){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<100){
                            Text("\($0) %")
                               
                        }
                    }
                    .pickerStyle(.navigationLink)
                    .foregroundStyle(tipPercentage == 0 ? .red : .primary)
                }
                
                Section("Total bill"){
                    Text(totalBill, format: .currency(code: Locale.current.currency?.identifier ?? "MXN"))
                }
                
                Section("Total per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "MXN"))
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
        
        }
        
    }


#Preview {
    ContentView()
}
