//
//  MusicView.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 22.12.2022.
//

import SwiftUI

struct MusicView: View {
    @StateObject var viewModel = MusicViewModel()
    
    var body: some View {
        ZStack{
            gradientLayer
            headerView
            
            VStack{
                categoryView
                quickPickView
                Spacer()
            }
        }
        .preferredColorScheme(.dark)
    }
}
extension MusicView {
    private var gradientLayer: some View{
        VStack{
            LinearGradient(colors: [.red, .clear], startPoint: .top, endPoint: .bottom)
                .frame(height: 214)
                .edgesIgnoringSafeArea(.top)
                .opacity(0.7)
            Spacer()
        }
    }
    private var headerView: some View{
        VStack{
            HeaderView()
            Spacer()
        }
        .padding(.horizontal)
    }
    private var categoryView: some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(viewModel.headerCategories, id: \.self) { category in
                    HStack{
                        Text(category.capitalized)
                            .font(.headline)
                            .fontWeight(.regular)
                    }
                    .padding(.horizontal)
                    .padding(.vertical,7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.white.opacity(0.29), lineWidth: 1)
                    )
                    .background(.white.opacity(0.14))
                    .cornerRadius(7)
                }
            }
            .scrollIndicators(.hidden)
            .padding(.top, 48)
            .padding(.leading)
        }
    }
    private var quickPickView: some View{
        VStack{
            HStack{
                Text("start radio from a song".uppercased())
                    .foregroundColor(.gray)
                    .font(.caption)
                Spacer()
            }
            HStack{
                Text("Quick picks")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.heavy)
                Spacer()
            }
        }
        .padding()
    }
}
struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
