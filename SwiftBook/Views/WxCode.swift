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
    
    @AppStorage("githubtoken") var token: String?
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var imageData: Data? = nil
    @State private var uploadStatus: String = "等待上传"

    var body: some View {
        VStack {
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
            }

            PhotosPicker(selection: $selectedItem, matching: .images) {
                Text("从相册选择图片")
            }
            .onChange(of: selectedItem) {
                loadSelectedPhoto()
            }
                
            Button("上传到 GitHub") {
                uploadImageToGitHub()
            }
            .padding()
            Text("token: \(token)")
            Text(uploadStatus)
                .foregroundColor(.gray)
        }
        .padding()
    }
    
    // 获取仓库列表
    private func getRepos() {
        print("获取仓库列表")
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
        let url = "https://api.github.com/repos/Sjj1024/PakePlus/contents/docs/wxcode.jpg"
            
        // 构建请求体
        let parameters: [String: Any] = [
            "message": "update code wxcode",
            "content": base64String,
        ]
        
        print("github token: \(token)")
        // 发送请求
        AF.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: [
            "Authorization": "Bearer ",
            "User-Agent": "PostmanRuntime/7.41.2",
        ])
        .validate()
        .responseJSON { response in
            switch response.result {
            case .success:
                uploadStatus = "上传成功"
            case .failure(let error):
                uploadStatus = "上传失败: \(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    WxCode()
}
