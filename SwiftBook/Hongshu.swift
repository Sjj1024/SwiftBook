//
//  Hongshu.swift
//  SwiftBook
//
//  Created by Song on 2024/7/6.
//

import SwiftUI

struct Hongshu: View {
    @State var current = 0
    var body: some View {
        NavigationStack {
            ScrollView(content: {
                TabView(selection: $current) {
                    HStack(content: {
                        VStack(content: {
                            CardItem(preImg: "juzi", avatar: "juzi", nickname: "11111", distance: "555")
                            CardItem(preImg: "putao", avatar: "putao", nickname: "putao", distance: "11")
                            CardItem(preImg: "shanchu", avatar: "xigua", nickname: "山竹", distance: "53")
                            Spacer()
                        })
                        VStack(content: {
                            Image("putao")
                                .resizable().aspectRatio(contentMode: .fit)
                            Image("xigua")
                                .resizable().aspectRatio(contentMode: .fit)
                            Spacer()
                        })
                    })
                    .padding(.horizontal)
                    .tag(0)
                    HStack(content: {
                        VStack(content: {
                            CardItem(preImg: "taozi", avatar: "taozi", nickname: "11111", distance: "555")
                            CardItem(preImg: "xigua", avatar: "xigua", nickname: "putao", distance: "11")
                            CardItem(preImg: "hongyou", avatar: "xigua", nickname: "山竹", distance: "53")
                            Spacer()
                        })
                        VStack(content: {
                            CardItem(preImg: "liulian", avatar: "liulian", nickname: "liula", distance: "11")
                            CardItem(preImg: "xigua2", avatar: "xigua2", nickname: "山竹", distance: "53")
                            Spacer()
                        })
                    })
                    .padding(.horizontal)
                    .tag(1)
                    HStack(content: {
                        VStack(content: {
                            CardItem(preImg: "taozi", avatar: "taozi", nickname: "11111", distance: "555")
                            CardItem(preImg: "liulian", avatar: "xigua", nickname: "putao", distance: "11")
                            CardItem(preImg: "xigua2", avatar: "xigua", nickname: "山竹", distance: "53")
                            Spacer()
                        })
                        VStack(content: {
                            CardItem(preImg: "liulian", avatar: "liulian", nickname: "liula", distance: "11")
                            CardItem(preImg: "taozi", avatar: "xigua2", nickname: "山竹", distance: "53")
                            Spacer()
                        })
                    })
                    .padding(.horizontal)
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height)
            })
            .background(.gray.opacity(0.3))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal, content: {
                    HStack {
                        Text("首页")
                            .onTapGesture {
                                current = 0
                            }
                        Text("附近")
                            .onTapGesture {
                                current = 1
                            }
                        Text("推荐")
                            .onTapGesture {
                                current = 2
                            }
                    }
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    HStack {
                        Image(systemName: "magnifyingglass")
                    }
                })
            }
            .tag("home")
        }
    }
}

#Preview {
    Hongshu()
}
