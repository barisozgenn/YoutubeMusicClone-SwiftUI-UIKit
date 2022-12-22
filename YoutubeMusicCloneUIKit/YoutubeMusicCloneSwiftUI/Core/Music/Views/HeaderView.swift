//
//  HeaderView.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 22.12.2022.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing:2){
            Image(systemName: "play.circle")
                .resizable()
                .frame(width: 18, height: 18)
                .padding(2)
                .background(.red)
                .clipShape(Circle())
            Text("Music")
                .font(.title2)
                .fontWeight(.heavy)
            
            Spacer()
            
            HStack(spacing: 24){
                
                Image(systemName: "dot.radiowaves.up.forward")
                    .resizable()
                    .frame(width: 20, height: 20)
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 22, height: 22)
                Image("profile-photo")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .clipShape(Circle())
            }
        }
        .tint(.white)
        .foregroundColor(.white)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .preferredColorScheme(.dark)
    }
}
