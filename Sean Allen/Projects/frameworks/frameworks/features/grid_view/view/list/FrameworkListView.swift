//
//  FrameworksListView.swift
//  frameworks
//
//  Created by Tino Krzelj on 29/09/2023.
//

import SwiftUI

struct FrameworksListView: View {
    
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
        NavigationStack {
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(value: framework) {
                        FrameworkListTitleView(framework: framework)
                    }
                    .listRowInsets(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
                }
                .listRowBackground(Color.clear)
            }
            .navigationTitle("🍏 Frameworks")
            .navigationBarTitleDisplayMode(.large)
            .scrollContentBackground(.hidden)
            .navigationDestination(for: Framework.self) { framework in
                FrameworkListDetailView(framework: framework)
            }
        }
        .tint(Color(.label))
    }
    
}

//#Preview {
//    FrameworksListView()
//}

struct FrameworksListView_Precview: PreviewProvider {
    static var previews: some View {
        FrameworksListView()
    }
}
