//
//  GameViewModel.swift
//  Challenge-Rock-Paper_Scissors
//
//  Created by Tino Krzelj on 06/05/2023.
//

import Foundation

@MainActor class GameViewModel: ObservableObject {
    
    // MARK: - DI
    
    private var gameService: RPSGameContract
    
    // MARK: - State
    
    @Published private(set) var score = 0
    @Published private(set) var gameType = RPSGameType.lose
    @Published private(set) var gameRandomChoice = RPSChoiceType.paper
    @Published private(set) var gameUserChoices = [RPSChoiceType]()
    @Published private(set) var isGameFinished = false
    
    // MARK: - Methods
    
    func getScore() -> Int {
        gameService.getScore()
    }
    
    func nextRound() {
        gameType = gameService.getRandomGameType()
        gameRandomChoice = gameService.getRandomGameChoice()
        gameUserChoices = gameService.getRandomUserChoices()
        isGameFinished = gameService.isGameFinished()
    }
    
    func resetGame() {
        gameService.resetGame()
        score = gameService.getScore()
        nextRound()
    }
    
    func validateUserAttempt(attemptIndex: Int) -> Bool {
        guard !isGameFinished else { return true }
        let userChoice = gameUserChoices[attemptIndex]
        let isUserCorrect = gameService.validateUserAttemptCorrect(gameType: gameType, userChoice: userChoice, gameChoice: gameRandomChoice)
        score = gameService.getScore()
        nextRound()
        return isUserCorrect
    }
    
    // MARK: - Inits
    
    init(gameService: RPSGameContract) {
        self.gameService = gameService
        nextRound()
    }
}
