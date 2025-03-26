//
//  WxCode.swift
//  SwiftBook
//
//  Created by Song on 2024/12/29.
//

import Alamofire
import PhotosUI
import SwiftUI

struct WxCode: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var sha: String = "Fetching..."
    @AppStorage("githubtoken") var token: String?
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var imageData: Data? = nil
    @State private var uploadStatus: String = "等待上传"
    
    @State private var showAlert = false

    var body: some View {
        VStack {
            Text("更新GitHub二维码")
                .font(.title)
                .padding()
            // 选择图片
            if let imageData,
               let uiImage = UIImage(data: imageData)
            {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
            } else {
                Text("选择一张图片")
                    .padding()
                    .font(.title)
            }

            PhotosPicker(selection: $selectedItem, matching: .images) {
                Text("从相册选择图片")
                    .padding()
                    .background(token != nil && token != "" ? .green : .gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .onChange(of: selectedItem) {
                loadSelectedPhoto()
            }
            
            Button(action: {
                if token != nil, token != "" {
                    uploadImageToGitHub()
                } else {
                    showAlert = true
                }
            }, label: {
                Text("上传到 GitHub")
                    .padding()
                    .background(token != nil && token != "" ? .green : .gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }).alert("提示", isPresented: $showAlert) {
                Button("确定", role: .cancel) {
                    print("弹窗确定")
                }
            } message: {
                Text("请先配置GithubToken")
            }

            Text(uploadStatus)
                .foregroundColor(.gray)
                .padding(.top)
        }
        .padding()
        .onAppear {
            getWxCodeSha()
        }
    }
    
    // 获取二维码图片的commit sha
    private func getWxCodeSha() {
        print("get wxcode sha")
        if token == nil || token == "" {
            return
        }
        let url = "https://api.github.com/repos/Sjj1024/PakePlus/contents/docs/static/imgs/wxcode.png"
        AF.request(url, method: .get, headers: [
            "Authorization": "Bearer " + (token ?? ""),
            "User-Agent": "PostmanRuntime/7.41.2",
        ]).responseDecodable(of: GitHubRes.self) { response in
            switch response.result {
            case .success(let fileData):
                sha = fileData.sha ?? ""
                print("wxcode sha: \(sha)")
            case .failure(let error):
                sha = "Error: \(error.localizedDescription)"
                print("wxcode error:\(error.localizedDescription)")
            }
        }
    }
        
    // 加载相册中选择的图片
    private func loadSelectedPhoto() {
        Task {
            if let selectedItem = selectedItem,
               let data = try? await selectedItem.loadTransferable(type: Data.self)
            {
                imageData = data
            }
        }
    }
        
    // 上传图片到 GitHub
    private func uploadImageToGitHub() {
        guard let imageData = imageData else {
            uploadStatus = "请先选择图片"
            return
        }
            
        // 将图片转换为Base64
        let base64String = imageData.base64EncodedString()
            
        // GitHub API 参数
        let url = "https://api.github.com/repos/Sjj1024/PakePlus/contents/docs/static/imgs/wxcode.png"
            
        // 构建请求体
        let parameters: [String: Any] = [
            "message": "update code wxcode",
            "content": base64String,
            "sha": sha,
        ]

        print("kaishishagnchuan")
        
        // 发送请求
        AF.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: [
            "Authorization": "Bearer " + (token ?? ""),
            "User-Agent": "PostmanRuntime/7.41.2",
        ])
        .responseDecodable(of: GitHubRes.self) { response in
            switch response.result {
            case .success:
                print("上传成功")
                uploadStatus = "上传成功"
            case .failure(let error):
                print("上传失败")
                uploadStatus = "上传失败: \(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    WxCode()
}
