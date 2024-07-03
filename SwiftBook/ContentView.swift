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
    @State var gender = ""
    @State var dataList = ["男", "女", "其他"]
    @State var timer = Date()
    @State var voice = 0.0
    @State var remember = true
    @State var info = "简介"

    var body: some View {
        VStack(alignment: .leading) {
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
            // 选择
            Label(
                title: { Text(gender) },
                icon: { Image(systemName: "person") }
            ).padding()
            Picker(selection: $gender, content: {
                ForEach(dataList, id: \.self) { item in
                    Text(item)
                }
            }) {
                Text("性别")
            }
            // 出生日期
            DatePicker(selection: $timer, displayedComponents: DatePickerComponents.date, label: {
                Text("出生日期:\(timer)")
            }).padding()
            // 声音大小
            HStack {
                Text("声音: \(voice)")
                Slider(value: $voice, in: -10 ... 10).tint(.red)
            }.padding()
            // 记住密码
            Toggle(isOn: $remember, label: {
                Text("记住密码")
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
