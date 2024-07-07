//
//  BorderTest.swift
//  SwiftBook
//
//  Created by Song on 2024/7/7.
//

import SwiftUI

struct BorderTest: View {
    var body: some View {
        Text("1024小神")
            .padding(30)
            .background(.blue)
            .foregroundColor(.white)
            .overlay(
                Rectangle()
                    .frame(width: 5, height: nil, alignment: .top)
                    .foregroundColor(Color.red),
                alignment: .trailing
            )
    }
}

#Preview {
    BorderTest()
}
