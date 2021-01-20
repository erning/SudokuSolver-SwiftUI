//
//  ContentView.swift
//  Shared
//
//  Created by Zhang Erning on 1/18/21.
//

import SwiftUI

struct ContentView: View {
    static let numbers: [UInt8] = [
        0, 0, 0, 4, 0, 6, 0, 0, 0,
        7, 0, 0, 2, 0, 0, 0, 9, 0,
        0, 0, 0, 0, 5, 3, 0, 0, 4,
        0, 1, 3, 0, 0, 0, 0, 4, 9,
        0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 4, 5, 0, 0, 0, 0, 2,
        3, 7, 0, 0, 6, 0, 0, 1, 0,
        5, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 2, 0, 0, 0, 0, 7, 0, 0,
    ]
    static let given: Set<Int> = {
        var given: Set<Int> = []
        for i in 0..<Self.numbers.count {
            if Self.numbers[i] > 0 {
                given.insert(i)
            }
        }
        return given
    }()

    var body: some View {
        BoardView(
            numbers: Self.numbers,
            given: Self.given
        )
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
