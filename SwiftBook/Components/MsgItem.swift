//
//  MsgItem.swift
//  SwiftBook
//
//  Created by Song on 2024/7/7.
//

import SwiftUI

struct MsgItem: View {
    var body: some View {
        HStack {
            Image("xigua").resizable().avator(w: 50, h: 50)
            VStack(alignment: .leading) {
                HStack {
                    Text("移民电话").font(.title3)
                    Spacer()
                    Text("2023-08-02")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Text("新人up主教你如何使用SwiftUI做出属于自己的APP新人up主教你如何使用SwiftUI做出属于自己的APP")
                    .lineLimit(1)
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }
        }.padding()
    }
}

#Preview {
    MsgItem()
}
