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
