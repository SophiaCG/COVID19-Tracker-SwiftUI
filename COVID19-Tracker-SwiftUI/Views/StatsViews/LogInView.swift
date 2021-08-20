//
//  LogInView.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/19/21.
//

import Foundation
import SwiftUI

struct LogInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
            NavigationView {
                
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    VStack {
                        Text("Welcome Back!\nLog In Below")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(50)
                            .multilineTextAlignment(.center)
                        
                        TextField("Email Address", text: $email)
                            .autocapitalization(.none)
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                            .foregroundColor(.white)
                            .padding(20)
                            .background(
                                RoundedRectangle(cornerRadius: 20.0, style: .circular)
                                    .foregroundColor(Color(.secondarySystemFill))
                                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 70)
                            )
                        
                        SecureField("Password", text: $password)
                            .autocapitalization(.none)
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20.0, style: .circular)
                                    .foregroundColor(Color(.secondarySystemFill))
                                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 70)
                            )
                                                
                        Spacer()
                        
                    }
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(true)
                }
            }
        }
        
    }
}
