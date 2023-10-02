//
//  FrameworkGridViewModel.swift
//  frameworks
//
//  Created by Tino Krzelj on 29/09/2023.
//

import Foundation

final class FrameworkGridViewModel: ObservableObject {
    
    // MARK: - Property Wrappers
    @Published var isShowingDetailView = false
    
    // MARK: - Computed Properties
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = selectedFramework != nil
        }
    }
}
