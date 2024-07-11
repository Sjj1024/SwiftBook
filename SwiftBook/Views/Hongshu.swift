//
//  Hongshu.swift
//  SwiftBook
//
//  Created by Song on 2024/7/6.
//

import SwiftUI

struct Hongshu: View {
    @State var current = 0
    @State var goDetail = false
    @Namespace var detail
    // 自定义自己视图中的观察对象
    @EnvironmentObject var person: Person

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(content: {
                    TabView(selection: $current) {
                        // 关注
                        FollowView()
                            .tag(0)
                        // 发现
                        HStack(content: {
                            // 点击跳转到子页面
                            VStack(content: {
                                NavigationLink {
                                    ContentDetail()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    CardItem(preImg: "taozi", avatar: "taozi", nickname: "11111", distance: "555")
                                }

                                CardItem(preImg: "xigua", avatar: "xigua", nickname: "putao", distance: "11")
                                    .onTapGesture {
                                        person.id = 2
                                    }
                                CardItem(preImg: "hongyou", avatar: "xigua", nickname: "山竹", distance: "53")
                                    .onTapGesture {
                                        person.id = 3
                                    }
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
                // 底部菜单tab
                BottomTab()
            }
        }
    }
}

#Preview {
    Hongshu().environmentObject(Person())
}
