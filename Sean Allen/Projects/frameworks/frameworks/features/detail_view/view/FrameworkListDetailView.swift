//
//  FrameworkListDetailView.swift
//  frameworks
//
//  Created by Tino Krzelj on 29/09/2023.
//

import SwiftUI

struct FrameworkListDetailView: View {
    
    // MARK: - Properties
    let framework: Framework
    
    // MARK: - Property Wrappers
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    
    // MARK: - View Protocol
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            FrameworkGridTitleView(framework: framework)
            
            Text(framework.description)
                .font(.system(.body))
                .padding(.horizontal)
            
            Spacer()
            Spacer()
            
            Button(action: {
                isShowingSafariView = true
            }, label: {
//                FButton(title: "Learn More")
                Label("Learn More", systemImage: "book.fill")
            })
            .buttonStyle(.bordered)
            .controlSize(.large)
            .buttonBorderShape(.capsule)
            .tint(.red)
        }
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(urlString: framework.urlString)
        })
    }
}

#Preview {
    FrameworkListDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
}
