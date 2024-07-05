//
//  SwitchTab.swift
//  SwiftBook
//
//  Created by song on 2024/7/4.
//

import SwiftUI

enum TabType: Int, Hashable {
    case home
    case videos
    case message
    case seting

    var title: String {
        switch self {
            case .home:
                return "Home"
            case .videos:
                return "Videos"
            case .message:
                return "Message"
            case .seting:
                return "Setting"
        }
    }

    var image: String {
        switch self {
            case .home:
                return "house.fill"
            case .videos:
                return "video.fill"
            case .message:
                return "message.fill"
            case .seting:
                return "printer.fill"
        }
    }
}

struct SwitchTab: View {
    @State private var selectedTab: TabType = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            VStack {
                Color.red.overlay(content: {
                    Button(action: {
                        selectedTab = TabType.message
                    }, label: {
                        Text("Go to Message page").padding().background().cornerRadius(10, antialiased: true)
                    })
                })
            }
            .frame(width: .infinity, height: .infinity)
            .ignoresSafeArea(edges: .top)
            .tabItem {
                Text("首页")
                Image(systemName: "house.fill")
            }
            .tag(TabType.home)

            Color(.blue)
                .ignoresSafeArea(edges: .top)
                .tabItem {
                    Text("消息")
                    Image(systemName: "message.fill")
                }
                .tag(TabType.message)

            Color(.purple)
                .ignoresSafeArea(edges: .top)
                .tabItem {
                    Text("视频")
                    Image(systemName: "video.fill")
                }
                .tag(TabType.videos)
                .badge(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

            Color(.brown)
                .ignoresSafeArea(edges: .top)
                .tabItem {
                    Text("设置")
                    Image(systemName: "printer.fill")
                }
                .tag(TabType.videos)

            Color(.cyan)
                .ignoresSafeArea(edges: .top)
                .tabItem {
                    Text("我的")
                    Image(systemName: "iphone.gen3.radiowaves.left.and.right.circle.fill")
                }
                .tag(TabType.videos)
        }
    }
}

#Preview {
    SwitchTab()
}
