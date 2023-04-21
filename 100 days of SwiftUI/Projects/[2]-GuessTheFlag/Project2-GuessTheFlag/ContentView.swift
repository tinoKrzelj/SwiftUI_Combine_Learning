//
//  ContentView.swift
//  Project2-GuessTheFlag
//
//  Created by Tino Krzelj on 19/04/2023.
//

import SwiftUI

struct ContentView: View {

    // MARK: - State Properties
    
    @State private var isInfoAlertShown = false
    @State private var isEndGameAlertShown = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    // MARK: - Properties
    
    @State private var roundsPlayedSoFar = 0
    private let roundsMax = 8
    
    // MARK: - Methods
    
    private func flagTapped(_ number: Int) {
        roundsPlayedSoFar += 1
        scoreTitle = number == correctAnswer ? "Correct" : "Wrong! You've selected \(countries[number])"
        if number == correctAnswer { score += 1 }
        
        if roundsPlayedSoFar == roundsMax {
            isEndGameAlertShown = true
        } else {
            isInfoAlertShown = true
        }
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    private func resetGame() {
        roundsPlayedSoFar = 0
        score = 0
        askQuestion()
    }
    
    // MARK: - View
    
        var body: some View {
            ZStack {
                LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("Guess The Flag")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    
                    VStack(spacing: 15) {
                        VStack {
                            Text("Tap the flag of")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            Text(countries[correctAnswer])
                                .font(.largeTitle.weight(.semibold))
                        }
                        
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(radius: 5.0)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 40)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                       
                    Spacer()
                    Spacer()
                    
                    Text("Score: \(score)")
                        .font(.title.bold())
                        .foregroundColor(.blue)
                    
                    Spacer()
                }
                .padding()
        }
    
        .alert(scoreTitle, isPresented: $isInfoAlertShown) {
            Button("Continue") {
                askQuestion()
            }
        } message: {
            Text("Your Score is \(score)")
        }
            
        .alert("End Game", isPresented: $isEndGameAlertShown) {
            Button("Reset") {
                resetGame()
            }
        } message: {
            Text("Game has ended and your score is \(score)/\(roundsMax)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// ZStack
// LinearGradient, AngularGradient, RadialGradient
// Change bg by adding Color.red
// foregroundStyle, .ultraThinMaterial, .primary, .secondary colors
// ignoreSafeArea
// Alert
