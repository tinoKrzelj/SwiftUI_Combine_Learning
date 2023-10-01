//
//  RockPaperScissorServiceContract.swift
//  Challenge-Rock-Paper_Scissors
//
//  Created by Tino Krzelj on 06/05/2023.
//

import Foundation

protocol RPSGameContract {
    func getRandomGameType() -> RPSGameType
    func getRandomGameChoice() -> RPSChoiceType
    func getRandomUserChoices() -> [RPSChoiceType]
    func getScore() -> Int
    func isGameFinished() -> Bool
    func validateUserAttemptCorrect(gameType: RPSGameType, userChoice: RPSChoiceType, gameChoice: RPSChoiceType) -> Bool
    func resetGame()
}
