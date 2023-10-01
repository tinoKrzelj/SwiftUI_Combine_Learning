//
//  RPSGameType.swift
//  Challenge-Rock-Paper_Scissors
//
//  Created by Tino Krzelj on 06/05/2023.
//

import Foundation

enum RPSGameType: CaseIterable {
    case win, lose
    
    var toString: String {
        switch(self) {
        case .win: return "WIN"
        case .lose: return "LOSE"
        }
    }
}
