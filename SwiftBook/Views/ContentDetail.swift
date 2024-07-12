//
//  ContentDetail.swift
//  SwiftBook
//
//  Created by song on 2024/7/10.
//

import SwiftUI

struct ContentDetail: View {
    // 轮播图
    @State var imgIndex = 1
    // 返回上个页面
    @Environment(\.presentationMode) var presentationMode
    // 定义全局观察对象
    @EnvironmentObject var person: Person
    // 用户评论内容
    @AppStorage("commit") private var commit: String = ""
    

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
                        .foregroundColor(Color("theam"))
                        .onTapGesture {
                            person.id += 1
                        }
                    Spacer()
                }
                // 评论内容
                HStack {
                    VStack {
                        ForEach(0 ..< 100) { _ in
                            HStack {
                                Image(person.manList[person.id].avator)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .mask(Circle())
                                VStack(alignment: .leading) {
                                    Text(person.manList[person.id].name)
                                        .foregroundStyle(.secondary)
                                    Text(person.manList[person.id].content)
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
                TextField("Username", text: $commit)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                // Spacer()
                HStack(spacing: 0) {
                    Image(systemName: "heart")
                    Text("13")
                }
                // Spacer()
                HStack(spacing: 0) {
                    Image(systemName: "star")
                    Text("13")
                }
                // Spacer()
                HStack(spacing: 0) {
                    Image(systemName: "message")
                    Text("13")
                }
            }.padding()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ContentDetail().environmentObject(Person())
}
