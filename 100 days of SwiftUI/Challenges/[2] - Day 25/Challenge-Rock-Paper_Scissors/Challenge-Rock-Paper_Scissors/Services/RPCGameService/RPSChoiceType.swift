//
//  RPSChoiceType.swift
//  Challenge-Rock-Paper_Scissors
//
//  Created by Tino Krzelj on 06/05/2023.
//

import Foundation

enum RPSChoiceType: CaseIterable {
    case rock, paper, scissor
    
    var toString: String {
        switch(self) {
        case .rock: return "rock"
        case .paper: return "paper"
        case .scissor: return "scissors"
        }
    }
}
