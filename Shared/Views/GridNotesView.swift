//
//  GridNotesView.swift
//  SudokuSolver
//
//  Created by Zhang Erning on 1/19/21.
//

import SwiftUI

struct GridNotesView: View {
    var notes: [Int: [UInt8]] = [:]

    var body: some View {
        GeometryReader { geometry in
            let width = min(geometry.size.width, geometry.size.height)
            let w: CGFloat = width / 9

            ForEach(0..<81) { i in
                let (x, y) = (CGFloat(i % 9), CGFloat(i / 9))
                if let note = self.notes[i] {
                    SquareView(note: note)
                        .offset(x: x * w, y: y * w)
                        .frame(width: w, height: w)
                }
            }
        }
        .scaledToFit()
    }

    struct SquareView: View {
        var note: [UInt8]

        var body: some View {
            GeometryReader { geometry in
                let width = min(geometry.size.width, geometry.size.height)
                let w: CGFloat = width / 3

                ForEach(0..<min(self.note.count, 8)) { i in
                    let j = i < 4 ? i : i + 1
                    let (x, y) = (CGFloat(j % 3), CGFloat(j / 3))
                    Text("\(self.note[i])")
                        .foregroundColor(Color(.systemGray))
                        .font(.system(size: w / 1.3, design: .monospaced))
                        .offset(x: x * w, y: y * w)
                        .frame(width: w, height: w)
                }
            }
            .scaledToFit()
        }
    }
}

struct GridNotesView_Previews: PreviewProvider {
    static var previews: some View {
        GridNotesView(
            notes: [
                1: [1, 2, 3, 4, 5, 6, 7, 8],
                2: [2, 3, 4, 5, 6, 7, 8, 9],
                81: [3],
            ]
        )
    }
}