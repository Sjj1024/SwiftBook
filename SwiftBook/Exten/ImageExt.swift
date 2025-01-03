//
//  ImageExt.swift
//  SwiftBook
//
//  Created by Song on 2024/7/6.
//

import SwiftUI

extension Image {
    func avator(w: CGFloat, h: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: w, height: h)
            .aspectRatio(contentMode: .fit)
            .mask(Circle())
    }
}


extension String {
    // Base64 编码
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    // Base64 解码
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
