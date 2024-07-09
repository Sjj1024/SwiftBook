//
//  LikeView.swift
//  SwiftBook
//
//  Created by song on 2024/7/9.
//

import SwiftUI

struct LikeView: View {
    var body: some View {
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
        }).foregroundColor(.black)
    }
}

#Preview {
    LikeView()
}
