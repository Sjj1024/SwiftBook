//
//  WxCode.swift
//  SwiftBook
//
//  Created by Song on 2024/12/29.
//

import _PhotosUI_SwiftUI
import SwiftUI

struct WxCode: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

    var body: some View {
        VStack {
            Text("更新微信群二维码").font(.title)
            // 选择图像
            if let selectedImageData, let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            } else {
                Text("No photo selected")
            }

            // 调用 ImagePicker 选择照片
            ImagePicker(selectedItem: $selectedItem, selectedImageData: $selectedImageData)
                .padding()
            // 确定/取消
            HStack {
                Button(action: {
                    print("ok")
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("确定")
                        .padding()
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }).padding()
                Button(action: {
                    print("cancel")
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("取消")
                        .padding()
                        .background(.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }).padding()
            }
        }
    }
}

#Preview {
    WxCode()
}
