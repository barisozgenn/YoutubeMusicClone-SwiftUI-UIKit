//
//  WideMusicCellView.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 23.12.2022.
//

import SwiftUI

struct WideMusicCellView: View {
    @Binding var selectedMusic: MusicModel
    @EnvironmentObject private var viewModel : MusicViewModel
    let music : MusicModel
    var body: some View {
        cellView
    }
}
extension WideMusicCellView{
    private var cellView: some View {
        HStack{
            Image("youtube-music-app-clone-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .cornerRadius(7)
                .onTapGesture {
                    withAnimation(.spring()){
                      
                    }
                }
            
            HStack{
                VStack(alignment: .leading,spacing:7){
                    Text(music.title)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text(music.artist)
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .foregroundColor(Color(.lightGray))
                }
                Spacer()
                VStack(spacing:0.5){
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 5)
                .foregroundColor(.white)
            }
            .padding(.leading)
        }
    }
}
struct WideMusicCellView_Previews: PreviewProvider {
    static var previews: some View {
        WideMusicCellView(selectedMusic: .constant(MusicModel(id: "", title: "SwiftUI", artist: "Baris Ozgen", imageUrl: "", musicUrl: "", durationInSeconds: 1)), music: MusicModel(id: "", title: "SwiftUI", artist: "Baris Ozgen", imageUrl: "", musicUrl: "", durationInSeconds: 1))
            .environmentObject(MusicViewModel())
            .preferredColorScheme(.dark)
    }
}
