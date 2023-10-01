//
//  ContentView.swift
//  [3]-ViewsAndModifiers
//
//  Created by Tino Krzelj on 21/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditActive = false
    @State private var searchTextField = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .blue], startPoint: .top, endPoint: .bottom)
                        
            VStack {
                
//                Button {
//                    isEditActive.toggle()
//                } label: {
//                    Image(systemName: isEditActive ? "pencil.circle.fill" : "pencil.circle")
//                        .frame(maxWidth: 60, maxHeight: 60)
//                        .font(Font.largeTitle)
//                        .background(.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
//                        .shadow(color: .gray,radius: 4.0)
//                }
                
                Spacer()
                
                Group {
                    TextField("Search...", text: $searchTextField)
                        .frame(maxHeight: 40)
                        .padding()
                }.clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    .padding()
                    .shadow(color: .white, radius: 2.0)
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                                
                HStack {
                    Spacer()
                    ForwardButton(title: "Back") { isEditActive = false }
                    ForwardButton(title: "Next") { isEditActive = true }
                }
                .offset(x: -24, y: -32)
            }
        }
        .ignoresSafeArea()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Custom View
// Using the custom modifier

struct ForwardButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .forwardButtonStyle()
                //.modifier(ForwardButtonStyle())
        }
    }
}

// MARK: - Custom ViewModifiers

struct ForwardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.black)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(.white)
            .clipShape(Capsule())
            
    }
}

// MARK: - View Extension

extension View {
    func forwardButtonStyle() -> some View {
        modifier(ForwardButtonStyle())
    }
}

// Custom modifiers and view extension (.modifier directly or View extension)
// enviroment modifiers like font and overriden from local
// Creating new view struct and using in project
// Group views will take VStack or HStack based on where they are used (Group is direction agnostic)
// @ViewBuilder wrapps view in tuple and we can add it when we create view as a property inside another view
