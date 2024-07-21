//
//  ScalRotaEffect.swift
//  SwiftBook
//
//  Created by Song on 2024/7/21.
//

import SwiftUI

struct ScalRotaEffect: View {
    // 缩放和旋转效果
    @State var useEffect = false
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.title)
                .scaleEffect(useEffect ? 1 : 0.7)
            Image("xigua")
                .resizable()
                .frame(width: 200, height: 200)
                .scaleEffect(useEffect ? 1 : 0.7)
                .rotationEffect(.degrees(useEffect ? 100 : 0))
            Button(action: {
                withAnimation { useEffect.toggle() }
            }, label: {
                Text("旋转和缩放")
            }).padding()
        }
    }
}

#Preview {
    ScalRotaEffect()
}
