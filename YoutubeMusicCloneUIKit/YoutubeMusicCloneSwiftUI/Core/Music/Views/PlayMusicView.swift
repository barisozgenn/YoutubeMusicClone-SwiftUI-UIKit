//
//  PlayMusicView.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 23.12.2022.
//

import SwiftUI

struct PlayMusicView: View {
    @State private var currentSecond = 0.0
    @State private var totalSecond = 129.0
    @State private var isPlayEditing = false
    
    var body: some View {
        ZStack{
            backgroundGradient
            VStack{
                headerView
                musicImageView
                musicSlider
                musicControlButton
                Spacer()
            }
            .padding()
            .padding(.horizontal)
        }
        
    }
}
extension PlayMusicView {
    private var backgroundGradient: some View{
        ZStack{
            Image("profile-photo")
                .resizable()
                .frame(width: .infinity)
                .blur(radius: 34)
                .opacity(0.7)
        }
        .ignoresSafeArea(.all)
        .background(Color.theme.tabBarBackgroundColor)
    }
    private var headerView: some View{
        HStack(spacing:22){
            Image(systemName: "chevron.down")
                .resizable()
                .scaledToFit()
                .frame(height: 14)
            Spacer()
            Image(systemName: "dot.radiowaves.up.forward")
                .resizable()
                .scaledToFit()
                .frame(height: 20)
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(height: 22)
        }
        .foregroundColor(.white)
    }
    private var musicImageView: some View {
        VStack{
            Image("profile-photo")
                .resizable()
                .scaledToFit()
                .frame(width: .infinity)
                .cornerRadius(7)
                .padding(.top, 34)
            HStack{
                Image(systemName: "hand.thumbsdown")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 27)
                    .foregroundColor(Color(.systemGray2))
                Spacer()
                VStack{
                    Text("SwiftUI")
                        .font(.system(size: 38))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("Baris Ozgen")
                        .font(.system(size: 19))
                        .fontWeight(.regular)
                        .foregroundColor(Color(.systemGray2))
                }
                .padding(.top)
                Spacer()
                Image(systemName: "hand.thumbsup")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 27)
                    .foregroundColor(Color(.systemGray2))
            }
            
        }
    }
    
    private var musicSlider: some View {
        VStack{
            durationSlider
            HStack{
                Text(setDurationInSecond(second: currentSecond))
                Spacer()
                Text(setDurationInSecond(second: totalSecond))
            }
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .foregroundColor(Color(.systemGray2))
        }
        .padding(.top,14)
    }
    
    private var musicControlButton: some View {
        VStack{
            
            HStack{
                Image(systemName: "shuffle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 22)
                Spacer()
                Image(systemName: "backward.end.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 22)
                Spacer()
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 27, height: 27)
                    .padding(34)
                    .background(.white.opacity(0.14))
                    .clipShape(Circle())
                Spacer()
                Image(systemName: "forward.end.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 22)
                Spacer()
                Image(systemName: "repeat")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 22)
            }
            .foregroundColor(Color(.systemGray5))
        }
        .padding(.top,14)
    }
    
    private var durationSlider: some View {
        Slider(
            value: $currentSecond,
            in: 0...totalSecond,
            onEditingChanged: { editing in
                isPlayEditing = editing
            }
        )
        .tint(.white)
        
    }
    
    func setDurationInSecond(second:Double) -> String{
        var secondValue = "00.00"
        let secondInt = Int(second)
        
        if secondInt < 10 { secondValue = "00:0\(secondInt)"}
        else if secondInt < 60 { secondValue = "00:\(secondInt)"}
        else {secondValue = "0\(Double(secondInt).asStringInMinute(style: .positional))"}
        
        return secondValue
    }
}
struct PlayMusicView_Previews: PreviewProvider {
    static var previews: some View {
        PlayMusicView()
    }
}
