//
//  Animation1.swift
//  SwiftBook
//
//  Created by song on 2024/7/10.
//
 
import SwiftUI
 
struct Animation1: View {
    @Namespace private var imageNamespace
    @State private var showImage: Bool = false
 
    var body: some View {
        VStack {
            if showImage {
                Image("xigua")
                    .resizable()
                    .matchedGeometryEffect(id: "xi", in: imageNamespace)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(contentMode: .fit)
            } else {
                VStack {
                    Image("xigua")
                        .resizable()
                        .matchedGeometryEffect(id: "xi", in: imageNamespace)
                        .frame(width: 100, height: 80)
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }
            }
        }.onTapGesture {
            withAnimation(.spring) {
                showImage.toggle()
            }
        }
    }
}
 
#Preview {
    Animation1()
}
