//
//  ScanCode.swift
//  SwiftBook
//
//  Created by Song on 2024/8/15.
//

import SwiftUI

struct ScanCode: View {
    // 扫描二维码并加载网站
    @State private var scannedCode: String? = nil
    @State private var isShowingScanner = false

    var body: some View {
        VStack {
            if let code = scannedCode, let url = URL(string: code), UIApplication.shared.canOpenURL(url) {
                WebView(url: url)
            } else if let code = scannedCode {
                Text("Scanned Code: \(code)")
                    .padding()
            } else {
                Button(action: {
                    isShowingScanner = true
                }) {
                    Text("Scan QR Code")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isShowingScanner) {
                    ScannerView { code in
                        self.scannedCode = code
                    }
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
}

#Preview {
    ScanCode()
}
