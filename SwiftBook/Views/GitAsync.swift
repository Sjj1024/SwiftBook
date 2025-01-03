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
    @State private var sha: String = "Fetching..."

    // 发送内容
    @State private var content = ""

    // 获取内容
    @State private var remoteList = ["1", "2"]

    var body: some View {
        ScrollView(content: {
            VStack(alignment: .leading, content: {
                HStack(content: {
                    Text("Github内容同步!")
                })
                TextField(text: $content, label: {
                    Text("同步内容")
                })
                HStack(content: {
                    Spacer()
                    Button(action: {}, label: {
                        Text("Push/Pull").padding()
                    })
                    Spacer()
                })
                // 获取内容列表
                ForEach(remoteList, id: \.self) { item in
                    Text(item)
                }
            })
            .padding(.horizontal)
            .onAppear {
                getAsyncContent()
            }
        })
    }

    func getAsyncContent() {
        if token != nil, token != "" {
            print("get async content")
            let url = "https://api.github.com/repos/Sjj1024/Sjj1024/contents/docs/gitasync.txt"
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
                    content = txtContent ?? "nil"

                case .failure(let error):
                    sha = "Error: \(error.localizedDescription)"
                    print("wxcode error:\(error.localizedDescription)")
                }
            }
        } else {
            print("config token")
        }
    }
}

#Preview {
    GitAsync()
}
