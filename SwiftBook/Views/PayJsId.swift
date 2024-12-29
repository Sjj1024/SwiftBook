//
//  PayJsId.swift
//  SwiftBook
//
//  Created by Song on 2024/12/29.
//

import SwiftUI

struct PayJsId: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("storeID") private var storeID: String = ""

    var body: some View {
        VStack {
            Text("设置PayJs商户ID").font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
            TextField(text: $storeID, label: {
                Text("storeID")
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
                    storeID = ""
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
    PayJsId()
}
