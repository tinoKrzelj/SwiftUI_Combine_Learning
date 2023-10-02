//
//  FDismissButton.swift
//  frameworks
//
//  Created by Tino Krzelj on 29/09/2023.
//

import SwiftUI

struct FDismissButton: View {
    
    // MARK: - Property Wrappers
    @Binding var isShown: Bool
    
    // MARK: - View Protocol
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                isShown = false
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
                    .background(.gray)
                    .clipShape(Circle())
            })
        }
        .padding()
    }
}

//#Preview {
//    FDismissButton(isShown: .constant(false))
//}

struct FDismissButton_Precview: PreviewProvider {
    static var previews: some View {
        FDismissButton(isShown: .constant(false))
    }
}
