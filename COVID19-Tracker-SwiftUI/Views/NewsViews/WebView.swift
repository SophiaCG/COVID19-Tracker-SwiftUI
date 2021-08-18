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
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    HStack {
                        TextField("Search a url",
                                  text: $model.urlString)
                            .keyboardType(.URL)
                            .autocapitalization(.none)
                            .padding(10)
                        Spacer()
                    }
                    .background(Color.white)
                    .cornerRadius(30)
                    
                    Button("Go", action: {
                        model.loadUrl()
                        model.urlString = "https://vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com/api/news/get-coronavirus-news/1?rapidapi-key=\(ViewModel().apiKey)"
                    })
                    .foregroundColor(.white)
                    .padding(10)
                    
                }.padding(10)
                
                ZStack {
                    WebViewRepresentable(webView: model.webView)
                    
                    if model.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                }
                
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
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
