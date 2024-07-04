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

    var title: String {
        switch self {
            case .home:
                return "Home"
            case .videos:
                return "Videos"
            case .message:
                return "Message"
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
                        Text("Go to Message page").padding().background().cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
        }
    }
}

#Preview {
    SwitchTab()
}
