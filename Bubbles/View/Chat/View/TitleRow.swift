//
//  TitleRow.swift
//  Bubbles
//
//  Created by Lara K on 29/11/1444 AH.
//

import SwiftUI

struct TitleRow: View {
    var name = "Bubbles"
    
    var body: some View {

            
            
            VStack {
                Text(name)
//                    .font(.title).bold()
//                    .foregroundColor(.white)
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.system(size: 30, design: .rounded))
                    .font(.title)
            }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
    }
}
