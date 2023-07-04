//
//  CardView.swift
//  Bubbles
//
//  Created by Lara K on 01/12/1444 AH.
//

import SwiftUI

struct BookingHomeCardView: View {
    
    
    var serviceType: String
    var price: Int
    
    
    var body: some View {
            
            
        VStack(alignment: .leading, spacing: 4.0) {
                
                VStack {
                    Text("Next Booking")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 5.0)
                
                
                HStack{
                    Text("Servic type:")
                        .fontWeight(.black)
                    
                    Text(serviceType)
                        
                } .font(.headline)
                    .bold()
                
                HStack{
                    Text("Date")
                        .fontWeight(.black)
                    
                    Text("Jun 23, 2023")
                        
                }
                .font(.headline)
                    .bold()
                    
                HStack{
                    Text("Time")
                        .fontWeight(.black)
                    
                    Text("12:00 PM")
                        
                }
                .font(.headline)
                    .bold()
                                
      
            
        } .padding(.trailing, 60.0)
    }
}

struct HomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        BookingHomeCardView(serviceType: "Gold Wash", price: 70)
    }
}
