//
//  CardItem.swift
//  SwiftBook
//
//  Created by Song on 2024/7/6.
//

import SwiftUI

struct CardItem: View {
    // 传递过来的图片和昵称
    var preImg = "xigua"
    var avatar = "xigua"
    var nickname = "西瓜"
    var distance = "19"

    var body: some View {
        VStack {
            Image(preImg)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                HStack {
                    Image(avatar)
                        .avator(w: 20, h: 20)
                    Text(nickname)
                }
                Spacer()
                Text("\(distance)km")
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
    }
}

#Preview {
    CardItem()
}
