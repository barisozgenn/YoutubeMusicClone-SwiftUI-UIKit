//
//  MusicView.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 22.12.2022.
//

import SwiftUI

struct MusicView: View {
    var body: some View {
        ZStack{
            VStack{
                LinearGradient(colors: [.red, .clear], startPoint: .top, endPoint: .bottom)
                    .frame(height: 192)
                    .edgesIgnoringSafeArea(.top)
                    .opacity(0.92)
                Spacer()
            }
            
            VStack{
                HeaderView()
                Spacer()
            }
            .padding(.horizontal)
            
            Text("Hello")
        }
        .preferredColorScheme(.dark)
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
