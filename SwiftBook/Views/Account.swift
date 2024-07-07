//
//  Account.swift
//  SwiftBook
//
//  Created by Song on 2024/7/7.
//

import SwiftUI

struct Account: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                // 个人头像
                HStack {
                    Image("xigua").avator(w: 80, h: 80)
                    VStack(alignment: .leading) {
                        Text("1024小神").font(.title2)
                        Text("1024小神").font(.footnote).foregroundColor(.secondary)
                    }
                    Spacer()
                }
            }.toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "barcode")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Image(systemName: "barcode.viewfinder")
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

#Preview {
    Account()
}
