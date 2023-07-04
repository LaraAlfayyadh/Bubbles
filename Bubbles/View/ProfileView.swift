//
//  ProfileView.swift
//  Bubbles
//
//  Created by Lara K on 29/11/1444 AH.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView{
            Form{

               // NavigationLink(destination: Profile()){
                    Section(){
                        HStack{
                            Image("profile")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .foregroundColor(.gray)
                            
                            
                            VStack(alignment:.leading){
                                Text("Lara")
                                    .bold()
                                    .font(.headline)
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color("Color2"))
                            }
                            .padding(.leading, 10.0)
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    }
               // }

                Section{
                    // NavigationLink(destination: Profile()){
                    HStack(spacing: 20){
                        Image(systemName: "bell.badge")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("Color2"))
                        
                        VStack{
                            Text("Notifications").font(.callout)
                            //}
                        }
                    }
                }
                
                Section{
                    
                    //NavigationLink(destination: Profile()){
                        HStack(spacing: 20){
                            Image(systemName: "car")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color("Color2"))
//
                            VStack{
                                Text("My Vehicles").font(.callout)
                            }
                        }
               
                }

                Section{
                   // NavigationLink(destination: Profile()){
                        HStack(spacing: 20){
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color("Color2"))
                            VStack{
                                Text("Personal Details").font(.callout)
                            }
                        }
                   // }
                //    NavigationLink(destination: Profile()){
                        HStack(spacing: 20){
                            Image(systemName: "lock")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color("Color2"))
                            VStack{
                                Text("Password & Security").font(.callout)
                            }
                       // }
                    }
                       
                    
                }

                Section{
                  
                   // NavigationLink(destination: Profile()){
                    HStack(spacing: 20){
                        Image(systemName: "message")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("Color2"))
                            
                        VStack{
                            Text("Live Chat").font(.callout)
                        //}
                    }
                }
                    
                    //  NavigationLink(destination: Profile()){
                          HStack(spacing: 20){
                              Image(systemName: "questionmark.circle")
                                  .resizable()
                                  .frame(width: 20, height: 20)
                                  .foregroundColor(Color("Color2"))
                                  
                              VStack{
                                  Text("Help").font(.callout)
                              //}
                          }
                      }
                }
            }.navigationTitle("My Account")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
