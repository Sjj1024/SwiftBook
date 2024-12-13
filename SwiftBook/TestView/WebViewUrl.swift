//
//  WebViewUrl.swift
//  SwiftBook
//
//  Created by song on 2024/12/13.
//

import SwiftUI

struct WebViewUrl: View {
    
    let url = URL(string: "https://www.apple.com")!
    
    var body: some View {
        WebView(url: url).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WebViewUrl()
}
