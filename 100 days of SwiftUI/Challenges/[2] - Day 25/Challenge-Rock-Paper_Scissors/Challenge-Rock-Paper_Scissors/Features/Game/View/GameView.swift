//
//  GameView.swift
//  Challenge-Rock-Paper_Scissors
//
//  Created by Tino Krzelj on 06/05/2023.
//

import SwiftUI

struct GameView: View {
    
    // MARK: - States
    
    @State private var choiceAlertIsPresented = false
    @State private var scoreAlertIsPresented = false
    
    // MARK: - Properties
    
    @StateObject private var viewModel = GameViewModel(gameService: RPSGame())
    
    // MARK: - Methods
    
    private func validateUserAttempt(atIndex index: Int) {
        let isUserCorrect = viewModel.validateUserAttempt(attemptIndex: index)
        choiceAlertIsPresented = !isUserCorrect && !viewModel.isGameFinished
        scoreAlertIsPresented = viewModel.isGameFinished
    }
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    addSpacer()
                    
                    HStack {
                        TitleTextView(message: "You have to \(viewModel.gameType.toString) against")
                        addSpacer()
                    }
                    
                    HStack {
                        ChoiceImageButton(imageName: viewModel.gameRandomChoice.toString)
                            .disabled(true)
                    }
                    .padding(.top, 16)
                    
                    HStack {
                        TitleTextView(message: "Your Choice")
                        addSpacer()
                    }
                    .padding(.top, 16)
                    
                    HStack {
                        ForEach(0..<3) { index in
                            ChoiceImageButton(imageName: viewModel.gameUserChoices[index].toString) {
                                validateUserAttempt(atIndex: index) 
                            }
                        }
                    }
                    .padding(.top, 16)
                    
                    addSpacer(amount: 6)
                    
                    Text("Score: \(viewModel.getScore())")
                        .font(.headline)
                }
            }         
            .alert("Wrong", isPresented: $choiceAlertIsPresented) {
                Text("Continue")
            } message: {
                Text("Let's try new one")
            }
            
            .alert("Game Finished", isPresented: $scoreAlertIsPresented) {
                Button { viewModel.resetGame() } label: { Text("Reset") }
            } message: {
                Text("Score: \(viewModel.getScore())")
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
