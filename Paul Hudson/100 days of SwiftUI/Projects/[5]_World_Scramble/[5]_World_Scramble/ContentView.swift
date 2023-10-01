//
//  ContentView.swift
//  [5]_World_Scramble
//
//  Created by Tino Krzelj on 13/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - State Properties
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0
    
    @State private var alertErrorTitle = ""
    @State private var alertErrorMessage = ""
    @State private var alertErrorShown = false
    
    // MARK: - View Protocol
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            
            .navigationTitle($rootWord)
            .navigationBarTitleDisplayMode(.large)
            .onSubmit(addNewWord)
            .onAppear(perform: getRandomRootWordFromFile)
            .alert(alertErrorTitle, isPresented: $alertErrorShown) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertErrorMessage)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Reset") {
                    resetGame()
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Text("Score: \(score)")
                }
            }
        }
    }
    
    // MARK: - Methods
    
    private func getRandomRootWordFromFile() {
        if let url = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let rawString = try? String(contentsOf: url) {
                let stringsArray = rawString.components(separatedBy: "\n")
                rootWord = stringsArray.randomElement() ?? "unknown"
                return
            }
        }
        fatalError("Fatal Error: File not included in project!")
    }
        
    private func addNewWord() {
        let formatterWord = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard formatterWord.count > 2 && formatterWord != rootWord else {
            wordError(title: "Oppps", message: "Word has to be different than the root one and have more than 3 characters")
            return
        }
        
        guard isOriginal(word: formatterWord) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: formatterWord) else {
            wordError(title: "Word not possible", message: "You can't spell that word from \(rootWord)")
            return
        }
        
        guard isReal(word: formatterWord) else {
            wordError(title: "Word not recognized", message: "You can't just make them up")
            return
        }
        
        score += 1
        
        withAnimation {
            usedWords.insert(formatterWord, at: 0)
        }
        newWord = ""
    }
    
        // Validation Methods
    
    private func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    private func isPossible(word: String) -> Bool {
        var tmpWord = word
        
        for letter in word {
            if let pos = tmpWord.firstIndex(of: letter) {
                tmpWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    private func wordError(title: String, message: String) {
        score -= 1
        alertErrorTitle = title
        alertErrorMessage = message
        alertErrorShown = true
    }
    
    private func resetGame() {
        getRandomRootWordFromFile()
        usedWords = []
        newWord = ""
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
