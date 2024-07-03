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
    @State var info = "简介"

    var body: some View {
        VStack {
            Image("desktop")
                .resizable()
                .frame(width: .infinity, height: 260)
                .mask(RoundedRectangle(cornerRadius: 30))

            TextField(text: $name, label: {
                Text("用户名")
            }).padding()
            SecureField(text: $password, label: {
                Text("密码")
            }).padding()
            TextEditor(text: $info)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
