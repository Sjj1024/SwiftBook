//
//  SetToken.swift
//  SwiftBook
//
//  Created by Song on 2024/12/28.
//

import SwiftUI

struct SetToken: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("githubtoken") private var token: String = ""

    var body: some View {
        VStack {
            Text("设置Github Token").font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
            TextField(text: $token, label: {
                Text("Token")
            })
            .font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
            .padding()

            HStack {
                Button(action: {
                    print("ok")
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("确定")
                        .padding()
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }).padding()
                Button(action: {
                    print("cancel")
                    token = ""
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("取消")
                        .padding()
                        .background(.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }).padding()
            }
        }.padding()
    }
}

#Preview {
    SetToken()
}
