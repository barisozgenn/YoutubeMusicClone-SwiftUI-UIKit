//
//  MusicView.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 22.12.2022.
//

import SwiftUI

struct MusicView: View {
    @StateObject var viewModel = MusicViewModel()
    @State var selectedMusic : MusicModel? = nil
    @State private var isExpanded = false
    let rows = [
        GridItem(.fixed(65)),
        GridItem(.fixed(65)),
        GridItem(.fixed(65)),
        GridItem(.fixed(65))
    ]
    let rowsRect = [
        GridItem(.fixed(143)),
        GridItem(.fixed(143))
    ]
    
    var body: some View {
        ZStack{
            gradientLayer
            headerView
            
            VStack{
                categoryView
                ScrollView{
                    quickPickView
                    listenAgainView
                    Spacer()
                }
            }
            
            VStack{
                Spacer()
                PlayMusicView(selectedMusic: $selectedMusic, isExpanded: $isExpanded)
                    .padding(.bottom,7)
                    .environmentObject(viewModel)
            }
            .ignoresSafeArea()
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
                    .font(.headline)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            HStack{
                Text("Quick picks")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
            }
            .padding(.horizontal)
            
            quickPickListView
        }
        .frame(height: 300)
    }
    private var quickPickListView: some View {
        GeometryReader { prox in
            ScrollView(.horizontal,showsIndicators: false){
                LazyHGrid(rows: rows, spacing: 0) {
                    ForEach(viewModel.musics) { item in
                        WideMusicCellView(selectedMusic: $selectedMusic, music: item)
                            .frame(width: prox.size.width - 58)
                            .padding(.leading, 14)
                            .environmentObject(viewModel)
                    }
                }
            }
            .frame(maxHeight: 300)
        }
    }
    private var listenAgainView: some View{
        VStack{
            HStack{
                Text("Listen Again")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
                
                Text("More")
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding(.vertical,4)
                    .padding(.horizontal,10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white, lineWidth: 1)
                    )
                
            }
            .padding(.horizontal)
            .padding(.top,80)
            listenAgainListView
        }
        .frame(maxHeight: 500)
    }
    private var listenAgainListView: some View {
        GeometryReader { prox in
            ScrollView(.horizontal,showsIndicators: false){
                LazyHGrid(rows: rowsRect, spacing: 0) {
                    ForEach(viewModel.musics) { item in
                        RectMusicCellView(selectedMusic: $selectedMusic, music: item)
                            .frame(width: 140)
                            .padding(.leading, -7)
                            .environmentObject(viewModel)
                    }
                }
            }
            .padding(.leading, 7)
            .frame(maxHeight: 400)
        }
    }
}
struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
