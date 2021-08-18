//
//  WebViewVM.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/17/21.
//

import WebKit
import Combine

// Code from: https://benoitpasquier.com/create-webview-in-swiftui/
class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
}

// Holds the logic of the web destination and how to load its content
class WebViewModel: ObservableObject {
    let webView: WKWebView
    
    private let navigationDelegate: WebViewNavigationDelegate
    
    init() {
        let configuration = WKWebViewConfiguration()
        configuration.websiteDataStore = .nonPersistent()
        webView = WKWebView(frame: .zero, configuration: configuration)
        navigationDelegate = WebViewNavigationDelegate()
        
        webView.navigationDelegate = navigationDelegate
        setupBindings()
    }
    
    @Published var urlString: String = ""
    @Published var canGoBack: Bool = false
    @Published var canGoForward: Bool = false
    @Published var isLoading: Bool = false
    
    private func setupBindings() {
        webView.publisher(for: \.canGoBack)
            .assign(to: &$canGoBack)
        
        webView.publisher(for: \.canGoForward)
            .assign(to: &$canGoForward)
        
        webView.publisher(for: \.isLoading)
            .assign(to: &$isLoading)
        
    }
    
    func getNews(completion:@escaping (NewsResults) -> ()) {
        
        guard let url = URL(string: "https://vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com/api/news/get-coronavirus-news/1?rapidapi-key=\(ViewModel().apiKey)") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard data != nil else {
                print("TASK ERROR 5: \(String(describing: error))")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(NewsResults.self, from: data!)
                
                DispatchQueue.main.async {
                    print("RESULT: \(results.news[0].title)")
                    completion(results)
                }
            } catch {
                print("RESULTS ERROR 5: \(error)")
            }
        }
        task.resume()
    }
    
    func loadUrl() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
    func goForward() {
        webView.goForward()
    }
    
    func goBack() {
        webView.goBack()
    }
}
