//
//  HomePage.swift
//  Bubbles
//
//  Created by Lara K on 27/11/1444 AH.
//

import SwiftUI
import CoreLocation

struct HomePage: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    
    var body: some View {
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

                VStack {
                    VStack{
                        InfoCarCardView(email: "lara@gmail.com", fullname: "Lara Alfayyadh", vechail: "G 550", model: "2023", plate: "L111", color: "Black")
                            .frame(width: 350, height: 130)
                            .background(.regularMaterial)
                            .cornerRadius(25)
                            .foregroundColor(.primary)
                    }
                    .padding(.bottom, 4.0)
                    
                    //
                    
                    BookingHomeCardView(serviceType: "Silver Wash", price: 50)
                        .frame(width: 350, height: 130)
                        .background(.regularMaterial)
                        .cornerRadius(25)
                        .foregroundColor(.primary)
                    
                    
                    
                    
                    //            Text("No booking!")
                    //                .bold()
                    //                .font(.title)
                    //                .padding(.bottom)
                    Spacer()
//                    
//                    Text("When you need to make an order,\npress the button below.")
//                        .multilineTextAlignment(.center)
//                        .padding(.bottom)
                    
                    VStack {
                  
                        Button {
                            
                        } label: {
                            NavigationLink(destination: MapView(coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))) {
                                
                                Text("Book a Service")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width - 45)
                                    .background(Color("Color2"))
                                    .cornerRadius(8)
                                    
                                    .autocapitalization(.none)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
                            }
                        }
                        
                        
                        
                        
                    }
                    Spacer()
                    Spacer()
                    
                }
                .padding(.bottom, 30.0)
            }
        }
        
    }
    
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}


