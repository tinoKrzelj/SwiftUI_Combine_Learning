//
//  FrameworksGridView.swift
//  frameworks
//
//  Created by Tino Krzelj on 29/09/2023.
//

import SwiftUI

struct FrameworksGridView: View {
    
    // MARK: - Property Wrappers
    @StateObject private var viewModel = FrameworkGridViewModel()
    
    // MARK: - Properties
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - View Protocol
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkGridTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍏 Frameworks")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkGridDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
    }
    
}

//#Preview {
//    FrameworksGridView()
//}

struct FrameworksGridView_Precview: PreviewProvider {
    static var previews: some View {
        FrameworksGridView()
    }
}
