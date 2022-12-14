//
//  RectMusicCellView.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 23.12.2022.
//

import SwiftUI

struct RectMusicCellView: View {
    @Binding var selectedMusic: MusicModel?
    @EnvironmentObject private var viewModel : MusicViewModel
    let music : MusicModel
    @State private var musicImage: UIImage = UIImage(named: "youtube-music-app-clone-logo")!
    var body: some View {
        cellView
    }
}
extension RectMusicCellView{
    private var cellView: some View {
        VStack(alignment:.leading){
            Image(uiImage: musicImage)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .cornerRadius(7)
            Text(music.title)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 120, height: 20,alignment: .leading)
                .lineLimit(1)
        }
        .onTapGesture {
            withAnimation(.spring()){
                selectedMusic = music
            }
        }
        .onAppear{
            viewModel.downloadImage(music: music) { image in
                withAnimation(.spring()){
                    musicImage = image
                }
            }
        }
    }
}
struct RectMusicCellView_Previews: PreviewProvider {
    static var previews: some View {
        RectMusicCellView(selectedMusic: .constant(MusicModel(id: "", title: "SwiftUI", artist: "Baris Ozgen", imageUrl: "", musicUrl: "", durationInSeconds: 1)), music: MusicModel(id: "", title: "SwiftUI", artist: "Baris Ozgen", imageUrl: "", musicUrl: "", durationInSeconds: 1))
            .environmentObject(MusicViewModel())
            .preferredColorScheme(.dark)
    }
}
