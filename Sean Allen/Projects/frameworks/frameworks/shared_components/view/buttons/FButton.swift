//
//  FButton.swift
//  frameworks
//
//  Created by Tino Krzelj on 29/09/2023.
//

import SwiftUI

struct FButton: View {
    
    // MARK: - Properties
    let title: String
    
    // MARK: - View Protocol
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 200, height: 50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

//#Preview {
//    FButton(title: "Test Title")
//}

struct FButton_Precview: PreviewProvider {
    static var previews: some View {
        FButton(title: "Test Title")
    }
}
