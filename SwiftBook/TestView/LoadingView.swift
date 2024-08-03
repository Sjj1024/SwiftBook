//
//  LoadingView.swift
//  SwiftBook
//
//  Created by Song on 2024/8/2.
//

import SwiftUI

struct LoadingView: View {
//    @State var process = 0.5

    @StateObject var proObs = ProcessObs()

//    @ObservedObject var proObs = ProcessObs()

    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .stroke(.gray.opacity(0.3), lineWidth: 18)
                    .frame(width: 200, height: 200)

                Circle()
                    .trim(from: 0, to: proObs.process)
                    .stroke(style: .init(lineWidth: 8, lineCap: .round))
                    .foregroundColor(.green)
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                Text("\(proObs.process)")
            }
            LoadingSub()
        }.padding()
    }
}


#Preview {
    LoadingView()
}
