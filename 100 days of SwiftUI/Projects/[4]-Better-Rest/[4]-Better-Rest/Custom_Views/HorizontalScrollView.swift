//
//  HorizontalScrollView.swift
//  BetterRest
//
//  Created by Tino Krzelj on 13/05/2023.
//

import SwiftUI

struct HorizontalSelectionView: View {
    
    // MARK: - State Properties
    
    @State private var itemNumberSelected = -1
    
    // MARK: - Properties
    
    private var content: [String]
    private var action: (Int) -> Void
    
    // MARK: - Init Methods
    
    init(content: [String], action: @escaping (Int) -> Void) {
        self.content = content
        self.action = action
    }
    
    // MARK: View Protocol
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<content.count, id: \.self) { index in
                    Button {
                        action(index)
                        itemNumberSelected = index == itemNumberSelected ? -1 : index
                    } label: {
                        Text(content[index])
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                            .background(itemNumberSelected == index ? .green : .gray)
                            .clipShape(Capsule())
                    }
                }
            }
            .padding([.leading, .trailing])
        }
    }
}
