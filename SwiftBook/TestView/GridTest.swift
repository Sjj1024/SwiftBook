//
//  GridTest.swift
//  SwiftBook
//
//  Created by Song on 2024/7/13.
//

import SwiftUI

struct GridTest: View {
    // 控制显示多少列，以及每列的宽度
    let columnNum = [
        GridItem(.flexible()),
        GridItem(.flexible(minimum: 10, maximum: 150)),
    ]

    var body: some View {
        LazyVGrid(columns: columnNum, content: {
            Text("PlaceholderPlaceholderPlaceholder")
            Text("Placeholder")
            Text("PlaceholderPlaceholderPlaceholder")
            Text("Placeholder")
            Text("PlaceholderPlaceholderPlaceholder")
            Text("Placeholder")
            Text("PlaceholderPlaceholderPlaceholder")
            Text("Placeholder")
        })
    }
}

#Preview {
    GridTest()
}
