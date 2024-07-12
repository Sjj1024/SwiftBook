//
//  AppStorageTest.swift
//  SwiftBook
//
//  Created by song on 2024/7/12.
//

import SwiftUI

struct AppStorageTest: View {
    @State private var text: String = ""

    func saveTextToFile(_ text: String) {
        let filename = getDocumentsDirectory().appendingPathComponent("output.txt")

        do {
            try text.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
            print("Saved to \(filename)")
        } catch {
            print("Failed to write to file: \(error.localizedDescription)")
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    var body: some View {
        VStack {
            TextField("Enter some text", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Save to file") {
                saveTextToFile(text)
            }
            Image("xigua")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(100))
        }
        .padding()
    }
}

#Preview {
    AppStorageTest()
}
