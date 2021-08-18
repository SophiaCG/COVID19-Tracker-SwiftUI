//
//  WebView.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/17/21.
//

import WebKit
import SwiftUI

// Code from: https://benoitpasquier.com/create-webview-in-swiftui/
struct WebViewRepresentable: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    let webView: WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}

struct WebView: View {
    
    // WKWebView is passed as parameter to be rendered, but it’s the actual model that controls its content
    @StateObject var model = WebViewModel()
    var url: String = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            WebViewRepresentable(webView: model.webView)
            
            if model.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: {
                    model.goBack()
                }, label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                })
                .disabled(!model.canGoBack)
                
                Button(action: {
                    model.goForward()
                }, label: {
                    Image(systemName: "arrowshape.turn.up.right")
                })
                .disabled(!model.canGoForward)
                
                Spacer()
            }
        }.onAppear() {
            model.urlString = url
            model.loadUrl()
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
