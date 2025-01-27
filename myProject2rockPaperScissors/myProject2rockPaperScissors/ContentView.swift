//
//  ContentView.swift
//  myProject2rockPaperScissors
//
//  Created by Nicolás Derbez on 22/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var options = ["🪨", "📃", "✂️"]
    @State private var round = 1
    @State private var score = 0
    @State private var computerMove = Int.random(in: 0...2)
    @State private var winOrLose = Bool.random()
    @State private var alertText = ""
    @State private var showAlert = false
    @State private var messageText = ""
    @State private var gameOver = false

    var body: some View {
        ZStack{
            Color.teal
                .ignoresSafeArea()
            VStack{
                Text("Round: \(round)")
                    .foregroundStyle(.white)
                    .font(.system(size: 30))
                Spacer()
                Text("You must \(winOrLose ? "win": "lose")")
                    .foregroundStyle(.white)
                    .font(.system(size: 30))
                Spacer()
                Text("Choose wisely...")
                    .padding()
                    .background(.ultraThinMaterial)
                    .foregroundColor(.white)

                HStack {
                    ForEach(0..<3) { selected in
                        Button{
                            buttonTapped(selected)
                        } label: {
                            Text(options[selected])
                                .font(.system(size: 50))
                                .padding()
                                .background(
                                    .ultraThinMaterial
                                )
                            
                        }.padding()
                            .clipShape(.capsule)
                            .shadow(radius: 5)
                    }
                    
                }
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.system(size: 30))
            }
            
        }
        .alert("Game over!", isPresented: $gameOver){
            Button("New game", action: restartGame)
        } message:{
            Text("Final score: \(score) / 10")
        }
        .alert(alertText, isPresented: $showAlert){
            Button("Continue", action: askQuestion)
        } message:{
            Text(messageText)
        }
              }
    
    func askQuestion(){
         computerMove = Int.random(in: 0...2)
         winOrLose = Bool.random()
        
    }
    
    func restartGame(){
        score = 0
        round = 0
    }

    func buttonTapped(_ userMove: Int){
        round += 1
        var result: Bool = false //1 for win, 0 for lose
        
        func win(){
            alertText = "You won"
            result = true
        }
        
        func lose(){
            alertText = "You lost"
            result = false
        }
        
        func tie(){
            alertText = "Tie"
            result = !winOrLose
        }
    
        
      
        
        switch userMove{
        case 0:
            switch computerMove{
            case 0:
                tie()
            case 1:
                lose()
            case 2:
                win()
            default: return
            }
        case 1:
            switch computerMove{
            case 0:
                win()
                
            case 1:
                tie()
            case 2:
                lose()
            default: return
            }
        case 2:
            switch computerMove{
            case 0:
                lose()
            case 1:
                win()
            case 2:
                tie()
        default: return
        }
        default: return
            
    
            
        }
        
        
        if result == winOrLose{
            score += 1
            
        }
        messageText = """
        You chose \(options[userMove])
        Computer chose \(options[computerMove])
        You \(result == winOrLose ? "earn a point!" : "don't earn a point.")
        """
        showAlert = true
        
        if round == 10{
            gameOver = true
        }
        
        }

        }

#Preview {
    ContentView()
}
