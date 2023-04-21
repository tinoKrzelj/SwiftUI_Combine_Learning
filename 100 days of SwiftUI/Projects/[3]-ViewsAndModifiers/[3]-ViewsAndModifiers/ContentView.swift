//
//  ContentView.swift
//  [3]-ViewsAndModifiers
//
//  Created by Tino Krzelj on 21/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditActive = false
    
    var body: some View {
        Text("dsadas")
            .prominentTitle()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Custom ViewModifiers

struct ProminentTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

// MARK: - View Extension

extension View {
    func prominentTitle() -> some View {
        modifier(ProminentTitle())
    }
}

// Custom modifiers and view extension (.modifier directly or View extension)
// enviroment modifiers like font and overriden from local
// Creating new view struct and using in project
// Group views will take VStack or HStack based on where they are used (Group is direction agnostic)
// @ViewBuilder wrapps view in tuple and we can add it when we create view as a property inside another view
