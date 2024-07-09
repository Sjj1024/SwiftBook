//
//  StackView.swift
//  SwiftBook
//
//  Created by song on 2024/7/4.
//

import SwiftUI

struct StackView: View {
    let colors: [Color] = [.red, .gray, .green, .orange, .pink, .brown, .cyan, .indigo, .purple, .yellow]

    let fruits: [String] = ["apple", "banana", "orange"]

//    @State private var path: [Color] = []

    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Colors") {
                    ForEach(colors, id: \.self) { color in
                        NavigationLink(value: color) {
                            Text("\(color.description.capitalized)")
                        }
                    }
                }
                Section("Fruits") {
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit) {
                            Text("\(fruit.capitalized)")
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Color.self) { color in
                Color(color)
            }
            .navigationDestination(for: String.self) { fruit in
                Text(fruit)
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    HStack(content: {
                        Text("附近")
                        Text("发现")
                        Text("公园")
                    })
                }
            })
        }
    }
}

#Preview {
    StackView()
}
