//
//  ContentDetail.swift
//  SwiftBook
//
//  Created by song on 2024/7/10.
//

import SwiftUI

struct ContentDetail: View {
    // 评论内容
    @State var commit = ""
    // 轮播图
    @State var imgIndex = 1
    // 返回上个页面
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        // 内容详情
        VStack {
            // 头部
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 24)).onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Image("xigua")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .mask(Circle())
                Text("负债老刘要上岸")
                Spacer()
                Button(action: {}, label: {
                    Text("关注")
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .foregroundColor(.red)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20).stroke(.red, lineWidth: 1)
                        }
                })
                Button(action: {}, label: {
                    Image(systemName: "square.and.arrow.up.fill")
                        .foregroundColor(.black)
                })
            }.padding(.horizontal)
            // 内容区域
            ScrollView(showsIndicators: false) {
                // 图片轮播
                TabView(selection: $imgIndex,
                        content: {
                            Image("xigua")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .tag(1)
                            Image("liulian")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .tag(2)
                            Image("hongyou")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .tag(3)
                        })
                        .tabViewStyle(.page)
                        .frame(height: 560)
                // 标题
                HStack {
                    Text("全世界最大的骗局就是山姆超市")
                        .font(.title2)
                        .padding(.horizontal)
                    Spacer()
                }
                // 评论内容
                HStack {
                    VStack {
                        ForEach(0 ..< 100) { index in
                            HStack {
                                Image("putao")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .mask(Circle())
                                VStack(alignment: .leading) {
                                    Text("自在\(index)")
                                        .foregroundStyle(.secondary)
                                    Text("别认为山姆会员都是骗子")
                                    Text("昨天 21:22 北京")
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Image(systemName: "heart")
                            }.padding(.horizontal)
                        }
                    }
                    Spacer()
                }
            }
            // 底部功能
            HStack {
                TextField("说点什么...", text: $commit)
                    .padding(5)
                Spacer()
                HStack {
                    Image(systemName: "heart")
                    Text("13")
                }
                HStack {
                    Image(systemName: "star")
                    Text("13")
                }
                HStack {
                    Image(systemName: "message")
                    Text("13")
                }
            }.padding()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ContentDetail()
}
