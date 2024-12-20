//
//  WebViewUrl.swift
//  SwiftBook
//
//  Created by song on 2024/12/13.
//

import SwiftUI

struct WebViewUrl: View {
    
    @State var isMenu = false
    
    @State var url = URL(string: "https://www.apple.com")!
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text("菜单")
                .padding()
                .onTapGesture {
                isMenu = !isMenu
            }
            WebView(url: url)
                .edgesIgnoringSafeArea(.bottom)
        })
        .overlay(alignment: .topLeading, content: {
            if isMenu {
                VStack(content: {
                    Text("百度").onTapGesture {
                        isMenu = !isMenu
                        url = URL(string: "https://www.bilibili.com/")!
                    }
                    Text("淘宝").onTapGesture {
                        isMenu = !isMenu
                        url = URL(string: "https://juejin.cn/")!
                    }
                    Text("百度").onTapGesture {
                        isMenu = !isMenu
                        url = URL(string: "https://www.bilibili.com/")!
                    }
                    Text("淘宝").onTapGesture {
                        isMenu = !isMenu
                        url = URL(string: "https://juejin.cn/")!
                    }
                })
                .frame(width: 200, height: .infinity)
                .background(Color.pink)
            }
        })

    }
}

#Preview {
    WebViewUrl()
}
