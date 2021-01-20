//
//  SquareHighlightView.swift
//  SudokuSolver
//
//  Created by Zhang Erning on 1/19/21.
//

import SwiftUI

struct HighlightView: View {
    var index: Int

    var body: some View {
        GeometryReader { geometry in
            let width = min(geometry.size.width, geometry.size.height)
            let w: CGFloat = width / 9

            let colorBackground = Color(.systemGray).opacity(0.2)
            let colorSelected = Color(.systemBlue).opacity(0.2)

            let (x, y) = (index % 9, index / 9)
            Path { path in
                // box
                path.addRect(
                    CGRect(
                        x: CGFloat(x / 3) * w * 3, y: CGFloat(y / 3) * w * 3,
                        width: w * 3, height: w * 3
                    ))
                // row
                path.addRect(
                    CGRect(
                        x: 0, y: CGFloat(y) * w,
                        width: w * 9, height: w
                    ))
                // column
                path.addRect(
                    CGRect(
                        x: CGFloat(x) * w, y: 0,
                        width: w, height: w * 9
                    ))
            }.fill(colorBackground)
            // square
            colorSelected
                .offset(x: CGFloat(x) * w, y: CGFloat(y) * w)
                .frame(width: w, height: w)

        }
        .scaledToFit()
    }
}

struct HighlightView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            HighlightView(index: 48)
            GridLinesView()
        }
    }
}
