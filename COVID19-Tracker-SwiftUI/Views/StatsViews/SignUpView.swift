//
//  SignUpView.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/19/21.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        VStack {
            NavigationView {
                
                if viewModel.isLoggedIn {
                    VStack {
                        Text("You are signed in")
                        Button {
                            viewModel.signOut()
                        } label: {
                            Text("Sign Out")
                                .foregroundColor(.white)
                                .padding(30)
                        }
                    }
                } else {
                    ZStack {
                        Color.black.edgesIgnoringSafeArea(.all)
                        VStack {
                            Text("Welcome!\nSign Up Below")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                                .padding(50)
                                .multilineTextAlignment(.center)
                            
                            TextField("Email Address", text: $email)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
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
                                .disableAutocorrection(true)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 20.0, style: .circular)
                                        .foregroundColor(Color(.secondarySystemFill))
                                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 70)
                                )
                            
                            NavigationLink(destination: LogInView()) {
                                Text("Already have an account? Login here!")
                            }
                            
                            Button(action: {
                                guard !email.isEmpty, !password.isEmpty else {
                                    return
                                }
                                
                                viewModel.signUp(email: email, password: password)
                            }, label: {
                                Text("Sign Up")
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(width: 150, height: 50, alignment: .center)
                                    .background(Color.green)
                                    .cornerRadius(30)
                                    .padding(30)
                            })
                            
                            Spacer()
                            
                        }
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarHidden(true)
                    }
                }
            }.onAppear() {
                viewModel.loggedIn = viewModel.isLoggedIn
            }
        }
        
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
