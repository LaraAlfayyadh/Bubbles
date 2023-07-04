//
//  BookServiceView.swift
//  Bubbles
//
//  Created by Lara K on 01/12/1444 AH.
//

import SwiftUI

struct BookServiceView: View {
    
    @State var selectedServiceType = "Silver"
    @State var paymentMethod = "Card"
    @State private var bookingDate = Date.now



    @ObservedObject var vm = BookService()
    var serviceType: String
    var description: String
    var img: String
    var price: Int

    var body: some View {
        
        VStack {

            VStack {
                Image(img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }.cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                )
                .padding([.top, .horizontal])
            
            
            
            VStack(spacing: 30.0) {
                //*
                Text("Select Date and Time")
                    .font(.headline)
                    .fontWeight(.black)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
                
                HStack {
                    DatePicker("", selection: $bookingDate)
                        //.foregroundColor(Color("Color2"))
                        

                }
                

                .padding(.trailing, 130.0)
                
                
                
                
                //*
                
                
                OptionsView(selectedOption: $paymentMethod, options: ["Card", "Cash"])
                    .padding()
                
                
                VStack(alignment: .leading) {
                    HStack{
                        Text("Servic type:")
                            .fontWeight(.black)
                        
                        Text(serviceType)
                            
                    } .font(.headline)
                        .bold()
                    
                    HStack {
                        
                        Text("Total amount:")
                            .fontWeight(.black)
                        
                        Text("\(price) SAR")
                            .bold()
                    }
                    .padding(.top)
                    .font(.headline)
                    .bold()
                    
                   
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                
               
                
                
                Button {
                    vm.createBooking(serviceType: selectedServiceType,
                                     paymentMethod: paymentMethod,
                                     bookStatus: "The paiker has arrived")
                }label: {
                    Text("Confirm Booking")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 45)
                        .background(Color("Color2"))
                        .cornerRadius(8)
                        .onTapGesture {
                        }
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
                    
                }
            }//: VSTACK
            .padding()
        }
    }
}
struct BookServiceView_Previews: PreviewProvider {
    static var previews: some View {
        BookServiceView(serviceType: "Silver Wash", description: "Quick, easy car washing\nEffective car cleaning \nInexpensive", img: "silver", price: 50)
    }
}
