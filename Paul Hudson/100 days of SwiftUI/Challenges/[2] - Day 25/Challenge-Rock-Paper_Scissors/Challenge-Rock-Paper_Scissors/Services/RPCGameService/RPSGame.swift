//
//  RPSGame.swift
//  Challenge-Rock-Paper_Scissors
//
//  Created by Tino Krzelj on 06/05/2023.
//

import Foundation

class RPSGame: RPSGameContract {
    
    // MARK: - Properties
    
    private var score = 0
    private var currentRound = 0
    private let numberOfRounds = 10
    
    // MARK: - API Methods
    
    func getRandomGameType() -> RPSGameType {
        let random = Int.random(in: 0..<2)
        return RPSGameType.allCases[random]
    }
    
    func getRandomGameChoice() -> RPSChoiceType {
        let random = Int.random(in: 0..<3)
        return RPSChoiceType.allCases[random]
    }
    
    func getRandomUserChoices() -> [RPSChoiceType] {
        return RPSChoiceType.allCases.shuffled()
    }
    
    func validateUserAttemptCorrect(gameType: RPSGameType, userChoice: RPSChoiceType, gameChoice: RPSChoiceType) -> Bool {
        var isUserCorrect: Bool
        
        switch(gameType) {
        case .lose:
            switch (gameChoice) {
            case .rock: isUserCorrect = userChoice == .scissor
            case .paper: isUserCorrect = userChoice == .rock
            case .scissor: isUserCorrect = userChoice == .paper
            }
            
        case .win:
            switch (gameChoice) {
            case .rock: isUserCorrect = userChoice == .paper
            case .paper: isUserCorrect = userChoice == .scissor
            case .scissor: isUserCorrect = userChoice == .rock
            }
        }
        
        score = isUserCorrect ? (score + 1) : (score - 1)
        currentRound += 1
        return isUserCorrect
    }
    
    func resetGame() {
        score = 0
        currentRound = 0
    }
    
    func getScore() -> Int {
        score
    }
    
    func isGameFinished() -> Bool {
        currentRound == numberOfRounds
    }
}
