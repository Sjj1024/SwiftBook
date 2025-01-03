//
//  GitAsync.swift
//  SwiftBook
//
//  Created by song on 2025/1/2.
//

import Alamofire
import SwiftUI

struct GitAsync: View {
    @AppStorage("githubtoken") var token: String?

    let url = "https://api.github.com/repos/Sjj1024/Sjj1024/contents/docs/gitasync.txt"
    @State private var sha: String = ""

    // 发送内容
    @State private var contentText = ""

    // 获取内容
    @State private var remoteList: [String] = ["loading..."]

    var body: some View {
        VStack(alignment: .leading, content: {
            HStack(content: {
                Text("Github内容同步!").padding(.vertical)
            })
            TextField(text: $contentText, label: {
                Text("同步内容")
            })
            HStack(content: {
                Button(action: {
                    Task {
                        await getAsyncContent()
                    }
                }, label: {
                    HStack {
                        Spacer()
                        Text("Push/Pull")
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                })
            }).padding(.vertical)
            // 获取内容列表
            ScrollView {
                ForEach(remoteList.reversed(), id: \.self) { item in
                    HStack {
                        Text(item)
                            .padding(.vertical)
                        Spacer()
                    }
                }
            }
        })
        .padding(.horizontal)
        .onAppear {
            Task {
                await getAsyncContent()
            }
        }
    }

    func getAsyncContent() async {
        if sha != "" && contentText != "" {
            remoteList.append(contentText)
            if remoteList.count > 20 {
                remoteList.removeLast()
            }
            // 同步到远程
            let newContent = remoteList.joined(separator: "|1|")
            // 使用base64进行编码
            let newBase64 = newContent.toBase64()
            // 构建请求体
            let parameters: [String: Any] = [
                "message": "update async content",
                "content": newBase64,
                "sha": sha,
            ]
            print("newBase64: \(newBase64)")
            AF.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: [
                "Authorization": "Bearer " + (token ?? ""),
                "User-Agent": "PostmanRuntime/7.41.2",
            ]).responseDecodable(of: GitHubRes.self) { _ in
                print("11")
                contentText = ""
            }
        } else {
            if token != nil, token != "" {
                print("get async content")
                AF.request(url, method: .get, headers: [
                    "Authorization": "Bearer " + (token ?? ""),
                    "User-Agent": "PostmanRuntime/7.41.2",
                ]).responseDecodable(of: GitHubRes.self) { response in
                    switch response.result {
                    case .success(let fileData):
                        sha = fileData.sha ?? ""
                        print("wxcode sha: \(sha)")
                        print("content: \(fileData.content!)")
                        let data = Data(base64Encoded: fileData.content!.replacingOccurrences(of: "\n", with: ""))
                        let txtContent = String(data: data!, encoding: .utf8)
                        remoteList = txtContent!.components(separatedBy: "|1|")
                    case .failure(let error):
                        print("wxcode error:\(error.localizedDescription)")
                    }
                }
            } else {
                print("config token")
            }
        }
    }
}

#Preview {
    GitAsync()
}
