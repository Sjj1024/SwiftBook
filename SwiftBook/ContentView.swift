//
//  ContentView.swift
//  SwiftBook
//
//  Created by song on 2024/7/2.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""

    @State var password = ""

    @State var info = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            TextField(text: $name, label: {
                Text("用户名")
            })
            SecureField(text: $password, label: {
                Text("密码")
            })
            TextEditor(text: $info)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
