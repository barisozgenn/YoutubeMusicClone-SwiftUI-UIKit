//
//  MainView.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 20.12.2022.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab = "Home"

    var body: some View {
        ZStack{
            TabView(selection: $selectedTab){
                
                MusicView()
                    .tabItem {
                        Image(systemName: "music.note.house")
                        Text("Home")
                    }
                    .tag("Home")
                
                MusicView()
                    .tabItem {
                        Image(systemName: "safari")
                        Text("Explore")
                    }
                    .tag("Explore")
                
                MusicView()
                    .tabItem {
                        Image(systemName: "tray.full")
                        Text("Library")
                    }
                    .tag("Library")
            }
            .tint(.white)
            .background(Color.theme.tabBarBackgroundColor)
        }
        .background(Color.theme.appBackgroundColor.preferredColorScheme(.dark))
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
