//
//  HomeView.swift
//  SwiftBook
//
//  Created by Song on 2024/12/28.
//

import SwiftUI

enum sheetID: Identifiable {
    var id: Int {
        hashValue
    }

    case setGitToken, setPayJsToken, wxCode, payjsCode
}

struct HomeView: View {
    @State private var sheetView: sheetID?

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
                            sheetView = .wxCode
                        }, label: {
                            Text("GitHub群二维码")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        Button(action: {
                            sheetView = .payjsCode
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
                            sheetView = .payjsCode
                        }, label: {
                            Text("内容同步")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        Button(action: {
                            sheetView = .payjsCode
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
                            sheetView = .payjsCode
                        }, label: {
                            Text("WebView")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        Button(action: {
                            sheetView = .payjsCode
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
                            sheetView = .payjsCode
                        }, label: {
                            Text("Tab切换")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        Button(action: {
                            sheetView = .payjsCode
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
                            sheetView = .setGitToken
                        }, label: {
                            Text("GithubToken")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        Button(action: {
                            sheetView = .setPayJsToken
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
                            sheetView = .payjsCode
                        }, label: {
                            Text("WxPusherToken")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        Button(action: {
                            sheetView = .payjsCode
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
            .sheet(item: $sheetView, content: { sheetView in
                switch sheetView {
                case .setGitToken:
                    SetToken()
                case .setPayJsToken:
                    PayJsId()
                case .wxCode:
                    WxCode()
                case .payjsCode:
                    PayjsCode()
                }
            })
        })
    }
}

#Preview {
    HomeView()
}
