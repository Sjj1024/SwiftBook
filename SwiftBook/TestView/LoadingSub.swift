//
//  LoadingSub.swift
//  SwiftBook
//
//  Created by Song on 2024/8/3.
//

import SwiftUI

struct LoadingSub: View {
//    @Binding var process: Double
//    @ObservedObject var pro = ProcessObs()
    @StateObject var pro = ProcessObs()

    var body: some View {
        VStack {
            Slider(value: $pro.process, in: 0 ... 1,
                   label: {}, minimumValueLabel: {
                       Text("最小")
                   }, maximumValueLabel: {
                       Text("最大")
                   }).padding(.top, 50)
            Text("\(pro.process)")
        }
    }
}

#Preview {
    LoadingSub()
}
