//
//  NotesView.swift
//  SwiftBook
//
//  Created by song on 2024/7/9.
//

import SwiftUI

struct NotesView: View {
    var body: some View {
        HStack(content: {
            VStack(content: {
                CardItem(preImg: "taozi", avatar: "taozi", nickname: "11111", distance: "555")
                CardItem(preImg: "xigua", avatar: "xigua", nickname: "putao", distance: "11")
                CardItem(preImg: "hongyou", avatar: "xigua", nickname: "山竹", distance: "53")
                Spacer()
            })
            VStack(content: {
                CardItem(preImg: "liulian", avatar: "liulian", nickname: "liula", distance: "11")
                CardItem(preImg: "xigua2", avatar: "xigua2", nickname: "山竹", distance: "53")
                Spacer()
            })
        }).foregroundColor(.black)
    }
}

#Preview {
    NotesView()
}
