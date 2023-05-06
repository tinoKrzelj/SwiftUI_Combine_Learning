//
//  TitleTextView.swift
//  Challenge-Rock-Paper_Scissors
//
//  Created by Tino Krzelj on 06/05/2023.
//

import SwiftUI

struct TitleTextView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .font(.largeTitle)
            .fontWidth(.compressed)
            .fontWeight(.heavy)
            .foregroundColor(.black)
            .padding(.leading)
    }
}
