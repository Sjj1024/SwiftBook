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
        VStack {
            NavigationStack {
                ScrollView(content: {
                    TabView(selection: $current) {
                        // 关注
                        FollowView()
                            .tag(0)
                        // 发现
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
                        .tag(1)
                        // 附近
                        HStack(content: {
                            VStack(content: {
                                CardItem(preImg: "xigua", avatar: "taozi", nickname: "11111", distance: "555")
                                CardItem(preImg: "default", avatar: "xigua", nickname: "putao", distance: "11")
                                CardItem(preImg: "xigua2", avatar: "xigua", nickname: "山竹", distance: "53")
                                Spacer()
                            })
                            VStack(content: {
                                CardItem(preImg: "liulian", avatar: "liulian", nickname: "liula", distance: "11")
                                CardItem(preImg: "taozi", avatar: "xigua2", nickname: "山竹", distance: "53")
                                Spacer()
                            })
                        })
                        .tag(2)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: UIScreen.main.bounds.height - 100)
                })
                .background(.gray.opacity(0.3))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal, content: {
                        HStack(spacing: 30) {
                            Text("关注")
                                .foregroundColor(
                                    current == 0 ? .blue : .black)
                                .onTapGesture {
                                    current = 0
                                }
                            Text("发现")
                                .foregroundColor(
                                    current == 1 ? .blue : .black)
                                .onTapGesture {
                                    current = 1
                                }
                            Text("附近")
                                .foregroundColor(
                                    current == 2 ? .blue : .black)
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
            }
            BottomTab()
        }
    }
}

#Preview {
    Hongshu()
}
