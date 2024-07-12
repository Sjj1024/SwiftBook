//
//  LineWrap.swift
//  SwiftBook
//
//  Created by song on 2024/7/12.
//

import SwiftUI

struct LineWrap: View {
    @State var wrapList = [
        ["王思聪", "wangjia", "wangwang"],
        ["马原", "mayun", "m"],
    ]

    var body: some View {
        Button(action: {
            print("点击按钮")
        }, label: {
            Text("点击移动")
                .padding()
                .background(.blue)
                .foregroundColor(.white)
        }).offset(x: 100, y: 100)
    }

    private func cell(index: Int) -> some View {
        Text("\(index)")
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
    }
}

#Preview {
    LineWrap()
}
