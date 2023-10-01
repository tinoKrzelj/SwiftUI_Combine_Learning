//
//  FlagImage.swift
//  Project2-GuessTheFlag
//
//  Created by Tino Krzelj on 21/04/2023.
//

import SwiftUI

struct FlagImage: View {
    var countryName: String
    
    var body: some View {
        Image(countryName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5.0)
    }
    
}
