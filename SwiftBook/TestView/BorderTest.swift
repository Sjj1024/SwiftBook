//
//  BorderTest.swift
//  SwiftBook
//
//  Created by Song on 2024/7/7.
//

import SwiftUI

struct BorderTest: View {
    @Binding var show: Bool

    @State var scrollVal: CGFloat = 0.0

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 24)).onTapGesture {
                        withAnimation(.spring) {
                            show.toggle()
                        }
                    }
                Image("xigua")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .mask(Circle())
                Text("1024小神\(scrollVal)")
                Spacer()
                Button(action: {}, label: {
                    Text("关注")
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .foregroundColor(.red)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20).stroke(.red, lineWidth: 1)
                        }
                })
                Button(action: {}, label: {
                    Image(systemName: "square.and.arrow.up.fill")
                        .foregroundColor(.black)
                })
            }
            .padding(.horizontal)
            ScrollView {
                ForEach(0 ..< 10) { _ in
                    Text("1024小神详情页面")
                        .padding(30)
                }
            }
        }.gesture(DragGesture().onChanged { sVal in
            scrollVal = sVal.location.x
        })
    }
}

#Preview {
    BorderTest(show: .constant(false))
}
