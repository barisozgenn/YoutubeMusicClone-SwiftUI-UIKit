//
//  PlayMusicView.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 23.12.2022.
//

import SwiftUI

struct PlayMusicView: View {
    @State var currentSecond = 0.0
    @State private var totalSecond = 129.0
    @State private var isExpanded = false
    private let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    @State private var isMusicPlaying = false
    
    var body: some View {
        ZStack{
            backgroundGradient
            VStack{
                headerView
                musicImageView
                musicSlider
                musicControlButton
                Spacer()
                    .scaleEffect(isExpanded ? 1 : 0)
            }
            .padding()
            .padding(.horizontal)
        }
        .frame(height: isExpanded ? .infinity : 77)
    }
}
extension PlayMusicView {
    private var backgroundGradient: some View{
        ZStack{
            Image("profile-photo")
                .resizable()
                .frame(width: .infinity)
                .blur(radius: 34)
                .opacity(!isExpanded ? 0 : 0.5)
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
                .onTapGesture {
                    withAnimation(.spring()){
                        isExpanded.toggle()
                    }
                }
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
        .frame(height: isExpanded ? 22 : 0)
        .foregroundColor(.white)
        .opacity(!isExpanded ? 0 : 1)
        .scaleEffect(!isExpanded ? 0 : 1)
        .padding(.top, isExpanded ? 29 : 0)
    }
    private var musicImageView: some View {
        layout{
            Image("profile-photo")
                .resizable()
                .scaledToFit()
                .frame(width: !isExpanded ? 64 : .infinity)
                .cornerRadius(7)
                .padding(.top, isExpanded ? 34 : 0)
                .onTapGesture {
                    withAnimation(.spring()){
                        isExpanded.toggle()
                    }
                }
                .toolbar(isExpanded ? .hidden : .visible, for: .tabBar)


            HStack{
                Image(systemName: "hand.thumbsdown")
                    .resizable()
                    .scaledToFit()
                    .frame(width: isExpanded ? 27 : 0, height: isExpanded ? 27 : 0)
                    .foregroundColor(Color(.systemGray2))
                    .opacity(!isExpanded ? 0 : 1)
                    .scaleEffect(!isExpanded ? 0 : 1)
                if isExpanded{ Spacer() }
                VStack(alignment: isExpanded ? .center : .leading, spacing: isExpanded ? 7 : 2){
                    Text("SwiftUI")
                        .font(.system(size: isExpanded ? 38 : 24))
                        .fontWeight(isExpanded ? .heavy : .semibold)
                        .foregroundColor(.white)
                    Text("Baris Ozgen")
                        .font(.system(size: 19))
                        .fontWeight(.regular)
                        .foregroundColor(Color(.systemGray2))
                }
                Spacer()
                Image(systemName: "hand.thumbsup")
                    .resizable()
                    .scaledToFit()
                    .frame(width: isExpanded ? 27 : 0, height: isExpanded ? 27 : 0)
                    .foregroundColor(Color(.systemGray2))
                    .opacity(!isExpanded ? 0 : 1)
                    .scaleEffect(!isExpanded ? 0 : 1)
                
                HStack(spacing: 29){
                    Image(systemName: isMusicPlaying ?  "pause.fill" : "play.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 22)
                        .onTapGesture {
                            withAnimation(.spring()){
                                isMusicPlaying.toggle()
                            }
                        }
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 22)
                }
                .foregroundColor(.white)
                .scaleEffect(isExpanded ? 0 : 1)
                .frame(width: isExpanded ? 0 : 74, height: isExpanded ? 0 : 22)
                
            }
            .padding(.top, isExpanded ? 29 : 0)
        }
        .padding(.top, isExpanded ? 0 : -14)
    }
    private var musicSlider: some View {
        VStack{
            durationSlider
            HStack{
                Text(setDurationInSecond(second: currentSecond))
                Spacer()
                Text(setDurationInSecond(second: totalSecond))
            }
            .scaleEffect(isExpanded ? 1 : 0)
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .foregroundColor(Color(.systemGray2))
        }
        .padding(.top, isExpanded ? 14 : -14)
        .padding(.horizontal, isExpanded ? 0 : -29)
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
                Image(systemName: isMusicPlaying ?  "pause.fill" : "play.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 27, height: 27)
                    .padding(34)
                    .background(.white.opacity(0.14))
                    .clipShape(Circle())
                    .onTapGesture {
                        withAnimation(.spring()){
                            isMusicPlaying.toggle()
                        }
                    }
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
        .opacity(!isExpanded ? 0 : 1)
        .scaleEffect(!isExpanded ? 0 : 1)
    }
    private var durationSlider: some View {
        ZStack{
            SwiftUISlider(
                thumbColor: .constant(.clear),
                    minTrackColor: .white,
                maxTrackColor: .darkGray,
                    value: $currentSecond,
                    maxValue: $totalSecond
                  )
            SwiftUISlider(
                thumbColor: .constant(.white),
                    minTrackColor: .white,
                maxTrackColor: .darkGray,
                    value: $currentSecond,
                    maxValue: $totalSecond
                  )
            .opacity(isExpanded ? 1 : 0)
        }
        .onReceive(timer) { _ in
                currentSecond += isMusicPlaying ? 1 : 0
        }
    }
    
    func setDurationInSecond(second:Double) -> String{
        var secondValue = "00.00"
        let secondInt = Int(second)
        
        if secondInt < 10 { secondValue = "00:0\(secondInt)"}
        else if secondInt < 60 { secondValue = "00:\(secondInt)"}
        else {secondValue = "0\(Double(secondInt).asStringInMinute(style: .positional))"}
        
        return secondValue
    }
    private var layout: AnyLayout {
        return isExpanded ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
    }
}
struct PlayMusicView_Previews: PreviewProvider {
    static var previews: some View {
        PlayMusicView()
    }
}
