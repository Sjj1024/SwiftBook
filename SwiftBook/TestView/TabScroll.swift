//
//  TabScroll.swift
//  SwiftBook
//
//  Created by song on 2024/7/9.
//

import SwiftUI

struct TabScroll: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0 ..< 10) { index in
                        Text("Item \(index)")
                            .frame(height: 100)
                    }
                }
                .padding()
            }
            .tabItem {
                Text("Scroll")
            }
            .tag(0)

            Text("Content of second tab")
                .tabItem {
                    Text("Second")
                }
                .tag(1)
        }
    }
}

#Preview {
    TabScroll()
}
