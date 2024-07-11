//
//  Model.swift
//  SwiftBook
//
//  Created by song on 2024/7/11.
//

import Foundation

// 创建模型类
class Person: ObservableObject {
    
    @Published var id: Int = 0

    @Published var manList: [Man] = [
        Man(index: 1, name: "王思聪", avator: "xigua", content: "好好"),
        Man(index: 2, name: "王健林", avator: "liulian", content: "你好"),
        Man(index: 3, name: "马云", avator: "taozi", content: "今天"),
        Man(index: 4, name: "马化腾", avator: "default", content: "天气"),
        Man(index: 5, name: "王亮", avator: "juzi", content: "真"),
        Man(index: 6, name: "王伦", avator: "putao", content: "不累"),
    ]
}

// 创建结构体
struct Man: Identifiable {
    var id = UUID()
    var index: Int
    var name: String
    var avator: String
    var content: String
}
