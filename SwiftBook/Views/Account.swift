//
//  Account.swift
//  SwiftBook
//
//  Created by Song on 2024/7/7.
//

import SwiftUI

struct Account: View {
    @State var current = 0

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                // 头部个人信息
                VStack {
                    // 个人头像
                    HStack {
                        Image("xigua").avator(w: 80, h: 80)
                        VStack(alignment: .leading) {
                            Text("1024小神").font(.title2).foregroundColor(.white)
                            Text("1024小神").font(.footnote).foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    HStack {
                        // 个人简介
                        Text("坚持，很宝贵的一种东西")
                            .font(.caption)
                            .foregroundColor(.white)
                        Spacer()
                    }.padding(.vertical)
                    // 性别和tag
                    HStack {
                        // 个人简介
                        Image(systemName: "figure.archery")
                            .padding(.horizontal)
                            .padding(.vertical, 3)
                            .foregroundColor(.blue)
                            .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 10))
                        Text("摄影博主")
                            .padding(.horizontal)
                            .padding(.vertical, 3)
                            .foregroundColor(.white)
                            .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 10))
                        Text("软件工程师")
                            .padding(.horizontal)
                            .padding(.vertical, 3)
                            .foregroundColor(.white)
                            .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 10))
                        Spacer()
                    }.font(.caption)
                    // 粉丝数和关注等
                    HStack {
                        VStack {
                            Text("89")
                            Text("关注")
                        }.foregroundColor(.white)
                        VStack {
                            Text("189")
                            Text("粉丝")
                        }.foregroundColor(.white)
                        VStack {
                            Text("829")
                            Text("获赞与收藏")
                        }.foregroundColor(.white)
                        Spacer()
                        // 编辑资料和设置
                        Button(action: {
                            print("编辑资料")
                        }, label: {
                            Text("编辑资料")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 8)
                                .foregroundColor(.white)
                                .background(.gray.opacity(0.3))
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.white, lineWidth: 1)
                                )
                        })
                        Button(action: {
                            print("设置")
                        }, label: {
                            Image(systemName: "gearshape")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .foregroundColor(.white)
                                .background(.gray.opacity(0.3))
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.white, lineWidth: 1)
                                )
                        })
                    }
                    .font(.caption)
                    .padding(.vertical)
                    // 购物车和创作等
                    HStack {
                        VStack {
                            HStack {
                                Image(systemName: "cart")
                                Text("购物车")
                            }.foregroundColor(.white)
                            Text("查看推荐好物")
                                .foregroundColor(.gray)
                                .font(.footnote)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(10)
                        Spacer()
                        VStack {
                            HStack {
                                Image(systemName: "lamp.ceiling")
                                Text("创作灵感")
                            }.foregroundColor(.white)
                            Text("学创作找灵感")
                                .foregroundColor(.gray)
                                .font(.footnote)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(10)
                        Spacer()
                        VStack {
                            HStack {
                                Image(systemName: "clock.arrow.circlepath")
                                Text("浏览记录")
                            }.foregroundColor(.white)
                            Text("看过的笔记")
                                .foregroundColor(.gray)
                                .font(.footnote)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(10)
                    }
                    .font(.caption)
                }
                .padding(.top, 110)
                .padding(.horizontal)
                .background(Image("liulian").resizable().aspectRatio(contentMode: .fill)
                    .overlay(Color.black.opacity(0.7)))
                // 内容列表
                VStack {
                    // 笔记和收藏+赞过
                    HStack(spacing: 40) {
                        Text("笔记")
                            .foregroundColor(
                                current == 0 ? .white : .gray)
                            .onTapGesture {
                                current = 0
                            }
                        Text("收藏")
                            .foregroundColor(
                                current == 1 ? .white : .gray)
                            .onTapGesture {
                                current = 1
                            }
                        Text("赞过")
                            .foregroundColor(
                                current == 2 ? .white : .gray)
                            .onTapGesture {
                                current = 2
                            }
                    }
                    // 内容区域
                    TabView(selection: $current) {
                        // 关注
                        NotesView().tag(0)
                        CollectorView().tag(1)
                        LikeView().tag(2)
                    }.tabViewStyle(.page(indexDisplayMode: .never))
                        .frame(height: UIScreen.main.bounds.height)
                }
                .padding(.top, 10)
                .background(.black)
                .cornerRadius(20, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "list.bullet").foregroundColor(.white)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Image(systemName: "plus.viewfinder")
                        Image(systemName: "square.and.arrow.up")
                    }.foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    Account()
}
