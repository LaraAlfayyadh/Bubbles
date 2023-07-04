//
//  SignInPage.swift
//  Bubbles
//
//  Created by Lara K on 27/11/1444 AH.
//

import SwiftUI
import FirebaseAuth

@MainActor
final class LogIn: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLodedin = false
    
//    func logIn() {
//        guard !email.isEmpty, !password.isEmpty else {
//            print("No email or password found.")
//            return
//        }
//
//        Task {
//            do {
//                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
//                print("Success")
//                print(returnedUserData)
//                isLodedin = true
//
//            } catch {
//                print("Error: \(error)")
//
//            }
//        }
//    }
    
    
    
    func logIn(){
        Auth.auth().signIn(withEmail: email, password: password) { [self] _, error in
                if let error = error {
                    print("Error logging in: \(error.localizedDescription)")
                    
                } else {
                    isLodedin = true
                }
            }
        }

}


struct SignInPage: View {
    @StateObject private var viewModel = LogIn()
    
    var body: some View {
        if viewModel.isLodedin {
            TabBarView()
        }else{
            NavigationView {
                VStack {
                    
                    ZStack {
                        Image("bg")
                            .resizable()
                            .frame(width: 470.0, height: 250.0)
                            .ignoresSafeArea()
                        
                        Text("Bubbles")
                            .foregroundColor(Color.white)
                            .bold()
                            .font(.system(size: 45, design: .rounded))
                            .font(.largeTitle)
                            .padding(.bottom, 55.0)
                            .padding(/*@START_MENU_TOKEN@*/.trailing, 140.0/*@END_MENU_TOKEN@*/)
                        
                        
                    }
                    
                    
                    //                NavigationView {
                    VStack {
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            TextField("Email", text: $viewModel.email)
                                .keyboardType(.emailAddress)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width - 45)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                            
                            
                            SecureField("Passwort", text: $viewModel.password)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width - 45)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                            
                        }
                        .padding(.top)
                        
                        NavigationLink("Forgot password?", destination: {
                            PasswordRecoverPage()
                        })
                        .foregroundColor(Color("Color2"))
                        
                        .padding(.leading, 190)
                        
                        
                        
                        Button {
                            viewModel.logIn()
                            viewModel.isLodedin = true
                        } label: {
                            Text("Sign In")
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 45)
                                .background(Color("Color2"))
                                .cornerRadius(8)
                                .autocapitalization(.none)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.top, 50.0)
                        }
                        
                        
                    }
                    //  Spacer()
                    HStack {
                        Text("Don't have an account?")
                        
                        
                        
                        NavigationLink(destination:
                                        SignUpPage()) {
                            Text("Sign Up.")
                                .foregroundColor(Color("Color2"))
                                .navigationBarHidden(true)
                        }
                    }
                    Spacer()
                    
                    //}
                }
            }
        }
        
    }
}


struct SignInPage_Previews: PreviewProvider {
    static var previews: some View {
        SignInPage()
    }
}
