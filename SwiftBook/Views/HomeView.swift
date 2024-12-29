//
//  HomeView.swift
//  SwiftBook
//
//  Created by Song on 2024/12/28.
//

import SwiftUI

struct HomeView: View {
    @State private var setToken: Bool = false
    @State private var sheetView: Int = 1

    var body: some View {
        ScrollView(content: {
            VStack(alignment: .leading, content: {
                // 常用功能
                VStack(alignment: .leading) {
                    HStack {
                        Text("常用功能").font(.title)
                        Spacer()
                    }

                    HStack {
                        Button(action: {
                            sheetView = 3
                            setToken = true
                        }, label: {
                            Text("GitHub群二维码")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        Button(action: {
                            sheetView = 2
                            setToken = true
                        }, label: {
                            Text("Payjs支付码")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                    }

                    HStack {
                        Button(action: {
                            setToken = true
                        }, label: {
                            Text("内容同步")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        Button(action: {
                            setToken = true
                        }, label: {
                            Text("常用网站")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                    }
                }
                .padding()
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.orange, lineWidth: 1)
                )
                // 代码示例
                VStack(alignment: .leading) {
                    HStack {
                        Text("代码示例").font(.title)
                        Spacer()
                    }

                    HStack {
                        Button(action: {
                            setToken = true
                        }, label: {
                            Text("WebView")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        Button(action: {
                            setToken = true
                        }, label: {
                            Text("页面跳转")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                    }

                    HStack {
                        Button(action: {
                            setToken = true
                        }, label: {
                            Text("Tab切换")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        Button(action: {
                            setToken = true
                        }, label: {
                            Text("消息提醒")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                    }
                }
                .padding()
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.orange, lineWidth: 1)
                )
                // 设置
                VStack(alignment: .leading) {
                    HStack {
                        Text("设置").font(.title)
                        Spacer()
                    }

                    HStack {
                        Button(action: {
                            sheetView = 1
                            setToken = true
                            print("sheetView value: \(sheetView)")
                        }, label: {
                            Text("GithubToken")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        Button(action: {
                            sheetView = 2
                            setToken = true
                            print("sheetView value: \(sheetView)")
                        }, label: {
                            Text("Payjs商户ID")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                    }

                    HStack {
                        Button(action: {
                            setToken = true
                        }, label: {
                            Text("WxPusherToken")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        Button(action: {
                            setToken = true
                        }, label: {
                            Text("定时任务")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                    }
                }
                .padding()
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.orange, lineWidth: 1)
                ).overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.orange, lineWidth: 1)
                )
                Spacer()
            })
            .padding()
            .sheet(isPresented: $setToken) {
                switch sheetView {
                    case 1:
                        SetToken()
                    case 2:
                        PayJsId()
                    case 3:
                        WxCode()
                    default:
                        NotFound()
                }
            }
        })
    }
}

#Preview {
    HomeView()
}
