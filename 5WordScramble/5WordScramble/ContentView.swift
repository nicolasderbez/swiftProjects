//
//  ContentView.swift
//  5WordScramble
//
//  Created by Nicolás Derbez on 29/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    
    var body: some View {
        
        NavigationStack{
            
            List{
                Section("Score"){
                    Text("\(score)")
                        .font(.headline)
                }
                Section{
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                Section{
                    
                    ForEach(usedWords, id: \.self){ word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
                
            }
            .navigationTitle(rootWord)
            .toolbar{
                Button("New game", action: startGame)
            }
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError){ } message: {
                Text(errorMessage)
            }
        }
        
        
            
        }
    
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {return}
        
        guard isOriginal(word: answer) else{
            wordError(title: "Word already guessed", message: "Be more original!")
            return
        }
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from \(rootWord)")
            return
        }
        guard isReal(word: answer) else {
            wordError(title: "Word not in list", message: "Is your word real?")
            return
        }
        
        guard lenghtValidation(word: answer) else{
            wordError(title: "Too short", message: "Word must be at least 3 letters long.")
            return
        }
        
        guard sameAsRoot(word: answer) else{
            wordError(title: "Same as root word!", message: "You ain't sly!")
            return
        }
        
        
        
        withAnimation{
            usedWords.insert(answer, at: 0)
            score += answer.count
        }
        newWord = ""
        
    }
    
    func startGame(){
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsURL, encoding: .utf8){
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement( ) ?? "silkworm"
                score = 0
                usedWords = []
                return
            }
        }
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool{
        !usedWords.contains(word)
    }
    
    
    func isPossible(word: String) -> Bool{
        var tempWord = rootWord
        
        for letter in word{
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            } else{
                return false
            }
        }
        return true
        
    }
    
    func isReal(word: String) -> Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
        
    }
    
    func lenghtValidation(word: String) -> Bool{
        let len = word.count
        return len >= 3
    }
    
    func sameAsRoot(word: String) -> Bool{
        if word == rootWord{
            return false
        }
        return true
    }
    
    func wordError(title: String, message: String){
        errorTitle = title
        errorMessage = message
        showingError = true
    }
      
    }
    
    


#Preview {
    ContentView()
}
