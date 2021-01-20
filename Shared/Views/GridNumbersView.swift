//
//  GridNumbersView.swift
//  SudokuSolver
//
//  Created by Zhang Erning on 1/19/21.
//

import SwiftUI

struct GridNumbersView: View {
    var numbers: [UInt8] = [UInt8](repeating: 0, count: 81)
    var given: Set<Int> = []

    var body: some View {
        GeometryReader { geometry in
            let width = min(geometry.size.width, geometry.size.height)
            let w: CGFloat = width / 9

            let font = Font.system(size: w / 2.2, design: .monospaced)
            let colorGivenForeground = Color.secondary
            let colorGivenBackground = Color(.systemGray6)
            let colorForeground = Color.primary

            ForEach(0..<81) { i in
                let (x, y) = (CGFloat(i % 9), CGFloat(i / 9))
                if self.numbers[i] > 0 {
                    if self.given.contains(i) {
                        Text("\(self.numbers[i])")
                            .font(font)
                            .foregroundColor(colorGivenForeground)
                            .frame(width: w, height: w)
                            .background(colorGivenBackground)
                            .offset(x: x * w, y: y * w)
                    } else {
                        Text("\(self.numbers[i])")
                            .font(font)
                            .foregroundColor(colorForeground)
                            .frame(width: w, height: w)
                            .offset(x: x * w, y: y * w)
                    }
                }
            }
        }
        .scaledToFit()
    }
}

struct GridNumbersView_Previews: PreviewProvider {
    static let numbers: [UInt8] = [
        7, 0, 0, 0, 0, 1, 5, 0, 9,
        2, 0, 0, 4, 0, 0, 0, 8, 0,
        0, 0, 0, 0, 0, 8, 0, 4, 7,
        0, 0, 0, 5, 0, 0, 8, 0, 1,
        0, 6, 0, 2, 8, 0, 0, 7, 4,
        0, 0, 0, 0, 0, 0, 0, 3, 0,
        0, 0, 0, 9, 0, 2, 0, 0, 0,
        4, 0, 5, 7, 0, 6, 0, 0, 0,
        0, 0, 0, 0, 5, 0, 0, 0, 2,
    ]
    static let given: Set<Int> = {
        var rv: Set<Int> = []
        for i in 0..<Self.numbers.count {
            if Self.numbers[i] > 0 && drand48() > 0.2 {
                rv.insert(i)
            }
        }
        return rv
    }()
    static var previews: some View {
        GridNumbersView(
            numbers: Self.numbers,
            given: Self.given
        )
        .padding()
    }
}
