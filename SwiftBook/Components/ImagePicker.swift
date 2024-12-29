//
//  ImagePicker.swift
//  SwiftBook
//
//  Created by Song on 2024/12/29.
//

import PhotosUI
import SwiftUI

struct ImagePicker: View {
    @Binding var selectedItem: PhotosPickerItem?
    @Binding var selectedImageData: Data?

    var body: some View {
        PhotosPicker(
            selection: $selectedItem,
            matching: .images, // 仅限选择图片
            photoLibrary: .shared())
        {
            Text("选择一张图片")
        }.onChange(of: selectedItem) {
            Task {
                // 从选中的项加载图片数据
                if let selectedItem, let data = try? await selectedItem.loadTransferable(type: Data.self) {
                    selectedImageData = data
                }
            }
        }
    }
}
