//
//  FollowView.swift
//  SwiftBook
//
//  Created by Song on 2024/7/7.
//

import SwiftUI

struct FollowView: View {
    @State var users = ["xigua", "damangguo", "juzi", "hongyou", "liulian", "lizhi", "putao", "shanchu", "taozi"]

    var body: some View {
        // 关注的用户列表，可以左右滑动
        ScrollView(.vertical, showsIndicators: false) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(users, id: \.self) { u in
                        Image(u).avator(w: 60, h: 60)
                    }
                }.padding(5)
            }
            ForEach(0 ..< 5) { _ in
                FollowUserCard()
            }
            Spacer()
        }.padding(.bottom, 70)
    }
}

#Preview {
    FollowView()
}
