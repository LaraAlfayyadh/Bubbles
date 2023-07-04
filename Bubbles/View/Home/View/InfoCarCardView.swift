//
//  InfoCarCardView.swift
//  Bubbles
//
//  Created by Lara K on 02/12/1444 AH.
//

import SwiftUI

struct InfoCarCardView: View {
    
    var email: String
    var fullname: String
    var vechail: String
    var model: String
   var plate: String
   var color: String
    
    var body: some View {
        ZStack {
            //(alignment: .leading)
            
            ZStack {
                Image("G550")
                    .resizable()
                    
                    .frame(width: 80, height: 80)
            } .padding(.trailing, 110.0)
                .padding(130)
            
            ZStack {
              HStack {
                
                Text(vechail)
                    .font(.title2)
                    
                    .fontWeight(.black)
                
                Circle()
                      .foregroundColor(.black)
                    .frame(width: 10.0, height: 10.0)
                  
                  Image(systemName: "star.fill")
                      .foregroundColor(Color("Color2"))
                      .padding(.leading, 50.0)
                      .frame(maxWidth: .infinity)
                  
            } .padding(.bottom, 50.0)
               .padding(.leading, 145.0)
            
                
                ZStack {
                    Text(model)
                    
                        .font(.headline)
                        .foregroundColor(.gray)
                        //.padding(.bottom, 20.0)
                    
                    Text(color)
                        .fontWeight(.black)
                        .padding(.top, 50.0)
                        .padding(/*@START_MENU_TOKEN@*/.leading, 4.0/*@END_MENU_TOKEN@*/)
                }
                .padding(.trailing, 30.0)
            }
            .padding(.leading, 80.0)
        }
        .padding(.trailing, 100.0)
    }
}

struct InfoCarCardView_Previews: PreviewProvider {
    static var previews: some View {
        InfoCarCardView(email: "lara@gmail.com", fullname: "Lara Alfayyadh", vechail: "G 550", model: "2023", plate: "L111", color: "Black")
    }
}
