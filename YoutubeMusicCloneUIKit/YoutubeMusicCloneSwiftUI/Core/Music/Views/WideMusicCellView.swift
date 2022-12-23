//
//  WideMusicCellView.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 23.12.2022.
//

import SwiftUI

struct WideMusicCellView: View {
    var body: some View {
        cellView
    }
}
extension WideMusicCellView{
    private var cellView: some View {
        HStack{
            Image("profile-photo")
                .resizable()
                .scaledToFit()
                .frame(width: 72)
                .cornerRadius(7)
                .onTapGesture {
                    withAnimation(.spring()){
                      
                    }
                }
            
            HStack{
                VStack(alignment: .leading,spacing:7){
                    Text("SwiftUI")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Baris Ozgen")
                        .font(.system(size: 22))
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
                .frame(width: 7)
                .foregroundColor(.white)
            }
            .padding(.leading)
        }
    }
}
struct WideMusicCellView_Previews: PreviewProvider {
    static var previews: some View {
        WideMusicCellView()
            .preferredColorScheme(.dark)
    }
}
