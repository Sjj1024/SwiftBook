//
//  RouterView.swift
//  SwiftBook
//
//  Created by song on 2024/7/4.
//

import SwiftUI

struct RouterView: View {
    @State var isClick = false

    var body: some View {
        Circle()
            .foregroundColor(isClick ? .orange : .blue)
            .overlay(content: {
                Text("点击一次")
                    .foregroundStyle(.white)
                    .fontWeight(.heavy)
            })
            .onTapGesture {
                isClick.toggle()
            }
        Circle()
            .foregroundColor(isClick ? .orange : .blue)
            .overlay(content: {
                Text("点击两次")
                    .foregroundStyle(.white)
                    .fontWeight(.heavy)
            })
            .onTapGesture(count: 2) {
                isClick.toggle()
            }
        Circle()
            .foregroundColor(isClick ? .orange : .blue)
            .overlay(content: {
                Text("长按触发")
                    .foregroundStyle(.white)
                    .fontWeight(.heavy)
            })
            .onLongPressGesture(perform: {
                isClick.toggle()
            })
    }
}

#Preview {
    RouterView()
}
