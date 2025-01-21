//
//  ContentView.swift
//  guessTheFlag
//
//  Created by Nicolás Derbez on 19/01/25.
//

import SwiftUI

struct flagImage: View{
    var array: [String]
    var num: Int
    var body: some View{
        Image(array[num])
            .clipShape(.capsule)
            .shadow(radius: 5)
        
    }
}

struct ContentView: View {
    @State private var score = 0
    @State private var gameOver: Bool = false
    
    @State private var rounds: Int = 0
    @State private var countries = ["Estonia", "France", "Germany", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var alertText = ""
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                Text("Round: \(rounds)/8")
                    .foregroundStyle(.white)
                    
                
                VStack(spacing: 15){
                    VStack {
                        Text("Tap the flag of:")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    
                    ForEach(0..<3){number in
                        
                        Button {
                            flagTapped(number)
                        } label: {
                            flagImage(array: countries, num: number)
                        }
                        
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert("Round over!", isPresented: $gameOver){
            Button("Restart", action: restartGame)
        } message: {
            Text("Your score was: \(score)/8")
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text(alertText)
        }
        
    }
    
    func flagTapped(_ number: Int){
        rounds += 1
        if number == correctAnswer{
            scoreTitle = "Correct"
            score += 1
            alertText = "Your score is: \(score)"
        } else{
            scoreTitle = "Wrong"
            alertText = "That was the flag of \(countries[number])"
        }
        showingScore = true
        if rounds == 8{
            gameOver = true
        }
        
    }
    
    func askQuestion(){
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
    }
    
    func restartGame(){
        gameOver = false
        score = 0
        rounds = 0
    }
    
}

#Preview {
    ContentView()
}
