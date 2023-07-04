//
//  TabView.swift
//  Bubbles
//
//  Created by Lara K on 27/11/1444 AH.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        TabView {

            HomePage()
            //SignInPage()
                .tabItem {
                    Label("Home", systemImage: "house") }

            ServiceListView()
            //SignUpPage()
            //ServiceList()
                .tabItem {
                    Label("Services", systemImage: "list.dash") }
            
            
            
            ChatPage()
                .tabItem {
                    Label("Support", systemImage: "ellipsis.message.fill") }

            ProfileView()
            //MapView()
                .tabItem {
                    Label("Profile", systemImage: "person") }
            


        }.accentColor(Color("Color1"))
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
