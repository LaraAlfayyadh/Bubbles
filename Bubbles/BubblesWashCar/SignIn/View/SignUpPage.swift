//
//  SignUpPage.swift
//  Bubbles
//
//  Created by Lara K on 27/11/1444 AH.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore


struct SignUpPage: View {
    @State var email = ""
    @State var fullName = ""
    @State var password = ""
    @State var repassword = ""
    @State  var isPresented = false
    @State  var vehicleName: String = ""
    @State  var model: String = ""
    @State  var plate: String = ""
    @State  var color: String = ""
    //@State var isSignUp = false
    
    
    @StateObject private var viewModel = LogIn()
    var body: some View {
        
        VStack {
            
            VStack {
                
                Text("Create Account")
                    .font(.title2)
                    .foregroundColor(.black)
                    .bold()
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 45)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
                TextField("Full Name", text: $fullName)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 45)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 45)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
                SecureField("Confirm Password", text: $repassword)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 45)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
                
            }
            .padding()
            
            VStack {
                
                Text("Add your vehicle")
                    .font(.title2)
                    .foregroundColor(.black)
                    .bold()
                
                TextField("Name Your Vehicle", text: $vehicleName)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 45)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
                TextField("Model", text: $model)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 45)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
                TextField("Plate", text: $plate)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 45)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
                TextField("Color", text: $color)
                    .keyboardType(.emailAddress)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 45)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
            }
            //
            NavigationLink(destination:
                            TabBarView()) {
                Button {
                    
                    addToDataBase(fullname: self.fullName, email: email, vechail: vehicleName, Model: model, plate: plate, color: color)
                    signUp()
                } label: {
                    Text("Sign up")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 45)
                        .background(Color("Color2"))
                        .cornerRadius(8)
                }
                
                .padding()
            }
            
            VStack {
                
                
                HStack {
                    
                    Text("Have an account?")
                    Button {
                        isPresented.toggle()
                    } label: {
                        Text("Sign In")
                    }
                    .foregroundColor(Color("Color2"))
                    .fullScreenCover(isPresented: $isPresented) {
                        SignInPage()
                    }
                }
                
                
            }
        }
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: email, password: password){ re , errors in
            if errors != nil{
                print(errors!.localizedDescription)
                
            } else {
                print(re!.description)
            }
        }
    }
    
    func addToDataBase(fullname: String , email: String , vechail: String , Model: String , plate: String , color: String){
        let dataBase = Firestore.firestore()
        dataBase.collection("users").document().setData([
            "fullname" : fullname,
            "email" :email,
            "vechail" : vechail,
            "Model" : Model ,
            "plate" : plate,
            "color" : color ,
        ])
        
        
    }
    
    
}
struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
