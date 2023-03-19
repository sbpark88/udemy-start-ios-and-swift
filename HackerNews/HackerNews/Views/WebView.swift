//
//  WebView.swift
//  HackerNews
//
//  Created by 박새별 on 2023/03/20.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    
    let url: String?
    
    func makeUIView(context: Context) -> UIViewType {
        WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let url else { return }
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
}
