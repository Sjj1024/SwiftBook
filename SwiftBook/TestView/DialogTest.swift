//
//  DialogTest.swift
//  SwiftBook
//
//  Created by Song on 2024/7/13.
//

import SwiftUI

struct DialogTest: View {
    @State var showSheet = false
    @State var showConfirm = false
    @State var showAlert = false
    @State var fullScreen = false
    var body: some View {
        VStack {
            Button(action: {
                showSheet = true
            }, label: {
                Text("显示Sheet弹窗")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
            })
            Button(action: {
                showConfirm = true
            }, label: {
                Text("显示Confirm弹窗")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
            })
            Button(action: {
                showAlert = true
            }, label: {
                Text("显示Alert弹窗")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
            })
            Button(action: {
                withAnimation(.easeInOut) {
                    fullScreen = true
                }
            }, label: {
                Text("显示FullScreen弹窗")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
            })
            Text("Hello, World!")
                .sheet(isPresented: $showSheet, content: {
                    Text("弹窗显示")
                })
                .alert("请确认",
                       isPresented: $showAlert, actions: {
                           // 底部的确认或者取消,默认会展示为按钮样式
                           Text("取消")
                           Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                               Text("确认")
                           })
                       }, message: {
                           // 弹窗的内容
                           Text("message")
                       })
                .confirmationDialog("", isPresented: $showConfirm, actions: {
                    // 只能放置按钮
                    Button(action: {}, label: {
                        Text("Button")
                    })
                    Text("confirm")
                }, message: {
                    Text("confirm")
                })
            // contentMenu 长按才有效果
            Text("contextMenu")
                .padding()
                .background(.blue)
                .contextMenu(menuItems: {
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 3")
                })
                .fullScreenCover(isPresented: $fullScreen, content: {
                    Text("全屏显示的内容")
                    Button(action: {
                        fullScreen = false
                    }, label: {
                        Text("关闭")
                    })
                })
        }
    }
}

#Preview {
    DialogTest()
}
