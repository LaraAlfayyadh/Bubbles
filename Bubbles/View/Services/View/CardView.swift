//
//  CardView.swift
//  Bubbles
//
//  Created by Lara K on 01/12/1444 AH.
//

import SwiftUI

struct CardView: View {
    var serviceType: String
    var description: String
    var img: String
    var price: Int
    
    var body: some View {
        
        
        VStack {
            ScrollView {
                Image(img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                HStack {
                    VStack(alignment: .leading) {
                        
                        
                        Text(serviceType)
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(8)
                        
                        HStack {
//                            VStack(alignment: .leading) {
                                Text(description)
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(nil)
                                    .padding(.top, 1.0)
                           // }
                            Text("\(price) SAR")
                                .bold()
                                .padding(.leading, 80.0)
                        }
                    }
                    .layoutPriority(100)
                    
                    Spacer()
                }
                .padding()
                
                
                //
                
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
            )
            .padding([.top, .horizontal])
            
            //
            
            
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(serviceType: "Silver Wash", description: "Quick, easy car washing\nEffective car cleaning \nInexpensive", img: "platinum", price: 50)
        
        
    }
}
