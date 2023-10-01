//
//  AnimationExampleView.swift
//  [6]_Animations
//
//  Created by Tino Krzelj on 14/05/2023.
//

import SwiftUI

struct AnimationExampleView: View {
    
    private let letters = Array("Hello, SwiftUI")
    
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    
    @State private var animationAmount = 1.0
    @State private var buttonEnabled = false
    
    var body: some View {
        VStack {
            
        /* Animation 1
                    Button("Tap Me") {
        //                animationAmount += 1
                    }
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(.red)
                            .scaleEffect(animationAmount)
                            .opacity(2 - animationAmount)
                            .animation(
                                .easeInOut(duration: 1)
                                //.repeatCount(3, autoreverses: true)
                                .repeatForever(autoreverses: false),
                                value: animationAmount) // Implict Animation
                    }
        //            .scaleEffect(animationAmount)
        //            .blur(radius: (animationAmount - 1) * 3)
                    .onAppear {
                        animationAmount = 2
                    }
        */
          
        /* Animation 2
                    VStack {
                        Stepper("Scale Amount", value: $animationAmount.animation(), in: 1...10)
                        
                        Spacer()
                        
                        Button("Tap Me") {
                            animationAmount += 1
                        }.padding(50)
                            .background(.red)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .scaleEffect(animationAmount)
                    }
                    
        */
                    
        /* Animation 3
                    
                    VStack {
                        Button("Tap Me") {
                            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                                animationAmount += 360
                            }
                        }.padding(50)
                            .background(.red)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0.5, y: 1, z: 0))
                    }
         */
            
        /* Animation 4
            VStack {
                Button("Tap Me") {
                    buruttonEnabled.toggle()
                }
                .frame(width: 200, height: 200)
                .background(buttonEnabled ? .green : .gray)
                .animation(.easeInOut(duration: 0.5), value: buttonEnabled)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: buttonEnabled ? 50 : 0))
                .animation(.easeInOut(duration: 4), value: buttonEnabled)
            }
            
            */
            
        /* Animation 5
            VStack {
                HStack(spacing: 0){
                    ForEach(0..<letters.count) { index in
                        Text(String(letters[index]))
                            .padding(5)
                            .font(.title)
                            .background(enabled ? .blue : .red)
                            .offset(dragAmount)
                            .animation(.default.delay(Double(index) / 20), value: dragAmount)
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }
                        .onEnded { _ in
                            dragAmount = .zero
                            enabled.toggle()
                        }
                )
                
            }
         */
            
            VStack {
                Text("Test")
            }
            
        }
        
    }
    
}


struct AnimationExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationExampleView()
    }
}
