//
//  FollowUserCard.swift
//  SwiftBook
//
//  Created by Song on 2024/7/7.
//

import SwiftUI

struct FollowUserCard: View {
    @State var commit = ""
    var body: some View {
        VStack {
            // 分割线
            Rectangle()
                .fill(.black)
                .frame(height: 1)
            // 头像和更多
            HStack {
                Image("xigua").avator(w: 30, h: 30)
                Text("你好")
                Text("6天前").foregroundColor(.secondary)
                Spacer()
                Image(systemName: "ellipsis")
            }.padding(.horizontal)
            // 图片
            Image("xigua2")
                .resizable()
                .frame(maxHeight: 400)
                .aspectRatio(contentMode: .fill)
            // 点赞分享
            HStack {
                Image(systemName: "square.and.arrow.up")
                Spacer()
                Image(systemName: "heart")
                Image(systemName: "star")
                Image(systemName: "ellipsis.message")
            }.padding(5)
            // 文字内容
            Text("无籽西瓜已进入香港市场。周至种西瓜有史已久，特别是近十多年来，新品种较多，有“周至红”、“兴城红”、“及醇酥”和“台黑”等一类脆瓤型西瓜").lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .padding(5)
            // 评论
            HStack {
                Image("xigua").avator(w: 30, h: 30).padding(5)
                TextField("请输入评论", text: $commit)
            }
            .background(.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 20))
            .padding(5)
        }
    }
}

#Preview {
    FollowUserCard()
}
