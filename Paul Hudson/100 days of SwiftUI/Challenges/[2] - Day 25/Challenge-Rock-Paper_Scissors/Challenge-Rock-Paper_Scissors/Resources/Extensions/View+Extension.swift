//
//  View+Extension.swift
//  Challenge-Rock-Paper_Scissors
//
//  Created by Tino Krzelj on 06/05/2023.
//

import SwiftUI

extension View {
    func addSpacer(amount: Int = 1) -> some View {
        let range: Range = 0..<amount
        return ForEach(range) { _ in Spacer() }
    }
}
