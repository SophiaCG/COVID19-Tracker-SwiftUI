////
////  FirebaseVM.swift
////  COVID19-Tracker-SwiftUI
////
////  Created by SCG on 8/19/21.
////
//
//import SwiftUI
//import Firebase
//import Combine
//
//// Code from: https://benmcmahen.com/authentication-with-swiftui-and-firebase/
//
//class SessionStore : BindableObject {
//    var didChange = PassthroughSubject<SessionStore, Never>()
//    var session: User? { didSet { self.didChange.send(self) }}
//    var handle: AuthStateDidChangeListenerHandle?
//
//    func listen () {
//        // monitor authentication changes using firebase
//        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//            if let user = user {
//                // if we have a user, create a new user model
//                print("Got user: \(user)")
//                self.session = User(
//                    uid: user.uid,
//                    displayName: user.displayName,
//                    email: user.email
//                )
//            } else {
//                // if we don't have a user, set our session to nil
//                self.session = nil
//            }
//        }
//    }
//
//    func signUp(
//        email: String,
//        password: String,
//        handler: @escaping AuthDataResultCallback
//        ) {
//        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
//    }
//
//    func signIn(
//        email: String,
//        password: String,
//        handler: @escaping AuthDataResultCallback
//        ) {
//        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
//    }
//
//    func signOut () -> Bool {
//        do {
//            try Auth.auth().signOut()
//            self.session = nil
//            return true
//        } catch {
//            return false
//        }
//    }
//    
//    func unbind () {
//        if let handle = handle {
//            Auth.auth().removeStateDidChangeListener(handle)
//        }
//    }
//
//}
//
//
//class User {
//    var uid: String
//    var email: String?
//    var displayName: String?
//
//    init(uid: String, displayName: String?, email: String?) {
//        self.uid = uid
//        self.email = email
//        self.displayName = displayName
//    }
//
//}
//
//
//struct LoginSignupView : View {
//    @EnvironmentObject var session: SessionStore
//
//    func getUser () {
//        session.listen()
//    }
//
//    var body: some View {
//      Group {
//        if (session.session != nil) {
//          Text("Hello user!")
//        } else {
//          SignInView()
//        }
//      }.onAppear(perform: getUser)
//    }
//}
//
//#if DEBUG
//struct LoginSignupView_Previews : PreviewProvider {
//    static var previews: some View {
//        LoginSignupView()
//            .environmentObject(SessionStore())
//    }
//}
//#endif
//
//struct SignInView : View {
//
//    @State var email: String = ""
//    @State var password: String = ""
//    @State var loading = false
//    @State var error = false
//
//    @EnvironmentObject var session: SessionStore
//
//    func signIn () {
//        loading = true
//        error = false
//        session.signIn(email: email, password: password) { (result, error) in
//            self.loading = false
//            if error != nil {
//                self.error = true
//            } else {
//                self.email = ""
//                self.password = ""
//            }
//        }
//    }
//
//    var body: some View {
//        VStack {
//            TextField("Email", text: $email)
//            SecureField("Password", text: $password)
//            if (error) {
//                Text("ahhh crap")
//            }
//            Button(action: signIn) {
//                Text("Sign in")
//            }
//        }
//    }
//}
