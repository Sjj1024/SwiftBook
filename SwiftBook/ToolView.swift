//
//  ToolView.swift
//  SwiftBook
//
//  Created by song on 2024/7/5.
//

import SwiftUI

struct ToolView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Color.red.overlay {
                    Text("1")
                }
            }
            .ignoresSafeArea()
            .toolbar {
                // 左侧便览
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        print("侧边栏")
                    }, label: {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.white)
                    })
                }
                // 右侧更多功能
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("更多")
                    }, label: {
                        Text("More").foregroundColor(.white)
                    })
                }
            }
        }
    }
}

#Preview {
    ToolView()
}
