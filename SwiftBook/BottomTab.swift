//
//  BottomTab.swift
//  SwiftBook
//
//  Created by Song on 2024/7/6.
//

import SwiftUI

struct BottomTab: View {
    @State var sel = "home"
    var body: some View {
        HStack {
            Spacer()
            Text("首页").onTapGesture {
                sel = "home"
            }.foregroundColor(sel == "home" ? .blue : .gray)
            Spacer()
            Text("购物").onTapGesture {
                sel = "shoping"
            }.foregroundColor(sel == "shoping" ? .blue : .gray)
            Spacer()
            Button(action: {
                sel = "publish"
            }, label: {
                Image(systemName: "plus")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(5)
            })
            Spacer()
            Text("消息").onTapGesture {
                sel = "message"
            }.foregroundColor(sel == "message" ? .blue : .gray)
            Spacer()
            Text("我的").onTapGesture {
                sel = "my"
            }.foregroundColor(sel == "my" ? .blue : .gray)
            Spacer()
        }
    }
}

#Preview {
    BottomTab()
}
