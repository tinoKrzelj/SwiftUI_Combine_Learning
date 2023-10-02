//
//  FrameworkGridDetailView.swift
//  frameworks
//
//  Created by Tino Krzelj on 29/09/2023.
//

import SwiftUI

struct FrameworkGridDetailView: View {
    
    // MARK: - Properties
    let framework: Framework
    
    // MARK: - Property Wrappers
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    
    // MARK: - View Protocol
    var body: some View {
        VStack(spacing: 32) {
    
            FDismissButton(isShown: $isShowingDetailView)
            
            Spacer()
            
            FrameworkGridTitleView(framework: framework)
            
            Text(framework.description)
                .font(.system(.body))
                .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                isShowingSafariView = true
            }, label: {
                FButton(title: "Learn More")
            })
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(urlString: framework.urlString)
        })
    }
}

//#Preview {
//    FrameworkGridDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
//}

struct FrameworkGridDetailView_Precview: PreviewProvider {
    static var previews: some View {
        FrameworkGridDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
    }
}
