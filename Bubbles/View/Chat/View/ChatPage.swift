//
//  ChatPage.swift
//  Bubbles
//
//  Created by Lara K on 29/11/1444 AH.


import SwiftUI

struct ChatPage: View {
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack {
            
            VStack {
                TitleRow()
                
                ScrollView {
                    ForEach(messagesManager.messages, id: \.id) { message in
                        MessageBubble(message: message)
                    }
                    
                    
                }
                .padding(.top, 10)
                 .background(Color("Color7"))
            }
            .background(Color("Color2"))
            
            MessageField().environmentObject(messagesManager)
        }
    }
}

struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        ChatPage()
    }
}
