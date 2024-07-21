//
//  LeftMenu.swift
//  SwiftBook
//
//  Created by Song on 2024/7/13.
//

import SwiftUI

struct LeftMenu: View {
    var body: some View {
        VStack {
            Color.cyan
            Text("内容")
        }
        .ignoresSafeArea()
        .overlay(content: {
            VStack(content: {
                Text("11")
            }).background(.orange)
        })
    }
}

#Preview {
    LeftMenu()
}
