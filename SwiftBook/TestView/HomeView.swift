//
//  HomeView.swift
//  SwiftBook
//
//  Created by song on 2024/7/11.
//

import SwiftUI

struct HomeView: View {
    // 是否显示子页面
    @State var showDetail = true
    @State var payVal = 0

    var body: some View {
        Group {
            // 主视图内容
            if showDetail {
                Color.blue
                    .overlay(content: {
                        Text("这是父级页面")
                            .foregroundStyle(.white)
                            .font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                    })
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            showDetail.toggle()
                        }
                    }
            } else {
                // 子视图内容
                BorderTest(show: $showDetail)
            }
        }
    }
}

#Preview {
    HomeView()
}
