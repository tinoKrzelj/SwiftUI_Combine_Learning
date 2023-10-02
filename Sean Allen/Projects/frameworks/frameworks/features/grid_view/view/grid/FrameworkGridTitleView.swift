//
//  FrameworkGridTitleView.swift
//  frameworks
//
//  Created by Tino Krzelj on 29/09/2023.
//

import SwiftUI

struct FrameworkGridTitleView: View {
    
    // MARK: - Properties
    let framework: Framework
    
    // MARK: - View Protocol
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
    
}
