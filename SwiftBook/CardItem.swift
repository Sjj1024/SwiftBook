//
//  CardItem.swift
//  SwiftBook
//
//  Created by Song on 2024/7/6.
//

import SwiftUI

struct CardItem: View {
    // 传递过来的图片和昵称
    var preImg = ""
    var avatar = ""
    var nickname = ""
    var distance = ""

    var body: some View {
        VStack {
            Image(preImg)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                HStack {
                    Image(avatar)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .mask(Circle())
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
