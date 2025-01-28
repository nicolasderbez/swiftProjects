//
//  ContentView.swift
//  4betterRest
//
//  Created by Nicolás Derbez on 27/01/25.
//

import SwiftUI
import CoreML

struct ContentView: View {
    

    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date{ //static: belongs to contentView itself and not a single instance, thus we can access it whenever and not get confused of which property should come first.
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
     var output: String{
        do{
            let config = MLModelConfiguration()
            let model  = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            return sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch{
            alertTitle = "Error"
            return "Sorry, there was a problem calculating your bedtime."
        }

    }

    var body: some View {
                
        
        NavigationStack{
            Form{
                Section(header: Text("When do you want to wake up?")){

                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute).labelsHidden()
                }
                Section(header: Text("Desired amount of sleep")){
     

                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 3...20, step: 0.25)
                    
                }
                
                Section(header: Text("Daily coffee intake")){
                    
                    Picker("Coffee cups per day", selection: $coffeeAmount){
                        ForEach(0..<10){
                            Text($0 == 1 ? "1 cup" : "\($0) cups")
                        }
                    }.pickerStyle(.wheel)
                }
                
                Section{
                    
                        Text("Your ideal bedtime is...")
                            .font(.headline)
                        Text(output)
                            
                    
                }
                
            }
            .navigationTitle("BetterRest")
            
        }
    }


    

    
}

#Preview {
    ContentView()
}
