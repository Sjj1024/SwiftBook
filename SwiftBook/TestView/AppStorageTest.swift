//
//  AppStorageTest.swift
//  SwiftBook
//
//  Created by song on 2024/7/12.
//

import SwiftUI

struct AppStorageTest: View {
    @State private var textVal: String = ""

    var body: some View {
        VStack {
            TextField("Enter some text", text: $textVal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .padding()
        .onChange(of: textVal, initial: false) { oldVal, newVal  in
            print("text change:\(oldVal)，\(newVal)")
        }
    }
}

#Preview {
    AppStorageTest()
}
