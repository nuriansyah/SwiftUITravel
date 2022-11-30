//
//  WebView.swift
//  Travel
//
//  Created by Nuriansyah Malik on 30/11/22.
//

import SwiftUI
import SafariServices

struct WebView: UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
