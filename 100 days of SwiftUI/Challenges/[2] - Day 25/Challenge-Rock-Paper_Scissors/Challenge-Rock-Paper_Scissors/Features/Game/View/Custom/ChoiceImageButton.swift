//
//  ChoiceImageButton.swift
//  Challenge-Rock-Paper_Scissors
//
//  Created by Tino Krzelj on 06/05/2023.
//

import SwiftUI

struct ChoiceImageButton: View {
    let imageName: String
    let size: CGSize
    let action: (() -> Void)?
    
    init(imageName: String, size: CGSize = CGSize(width: 80, height: 80), action: (() -> Void)? = nil) {
        self.imageName = imageName
        self.size = size
        self.action = action
    }
    
    var body: some View {
        Button {
            action?()
        } label: {
            Image(imageName)
                .resizable()
                .frame(width: size.width, height: size.height)
                .padding()
                .scaledToFit()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
