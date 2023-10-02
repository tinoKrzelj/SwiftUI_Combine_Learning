//
//  SafariView.swift
//  frameworks
//
//  Created by Tino Krzelj on 29/09/2023.
//

import SwiftUI
import SafariServices

// Creating SwiftUI View that Uses UIKit ViewController

struct SafariView: UIViewControllerRepresentable {
    let urlString: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let url = URL(string: urlString)!
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}
