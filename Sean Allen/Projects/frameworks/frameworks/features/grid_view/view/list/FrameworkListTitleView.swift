//
//  FrameworkListTitleView.swift
//  frameworks
//
//  Created by Tino Krzelj on 29/09/2023.
//

import SwiftUI

struct FrameworkListTitleView: View {
    
    // MARK: - Properties
    let framework: Framework
    
    // MARK: - View Protocol
    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 70, height: 70)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .padding(16)
        }
    }
}

#Preview {
    FrameworkListTitleView(framework: MockData.sampleFramework)
}

