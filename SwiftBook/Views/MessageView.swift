//
//  MessageView.swift
//  SwiftBook
//
//  Created by Song on 2024/7/7.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                // 顶部的三个菜单
                HStack(spacing: 50) {
                    VStack {
                        Image(systemName: "heart.fill").foregroundColor(.pink)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.pink.opacity(0.1)))
                        Text("赞和收藏")
                    }
                    VStack {
                        Image(systemName: "person.fill").foregroundColor(.blue)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue.opacity(0.1)))
                        Text("赞和收藏")
                    }
                    VStack {
                        Image(systemName: "ellipsis.message.fill").foregroundColor(.green)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.green.opacity(0.1)))
                        Text("赞和收藏")
                    }
                }
                // 消息列表
                ForEach(0 ..< 5) { _ in
                    MsgItem()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal,
                            content: {
                                Text("消息")
                            })
                ToolbarItem(placement: .topBarTrailing,
                            content: {
                                HStack(content: {
                                    Image(systemName: "person.2")
                                    Text("发现群聊")
                                })
                            })
            }
        }
    }
}

#Preview {
    MessageView()
}
