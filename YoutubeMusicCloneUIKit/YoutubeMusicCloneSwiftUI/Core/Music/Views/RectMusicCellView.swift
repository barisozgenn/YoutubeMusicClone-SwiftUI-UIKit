//
//  RectMusicCellView.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 23.12.2022.
//

import SwiftUI

struct RectMusicCellView: View {
    var body: some View {
        cellView
    }
}
extension RectMusicCellView{
    private var cellView: some View {
        VStack(alignment:.leading){
            Image("profile-photo")
                .resizable()
                .scaledToFit()
                .frame(width: 172)
                .cornerRadius(7)
                .onTapGesture {
                    withAnimation(.spring()){
                        
                    }
                }
            Text("SwiftUI")
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}
struct RectMusicCellView_Previews: PreviewProvider {
    static var previews: some View {
        RectMusicCellView()
            .preferredColorScheme(.dark)
    }
}
