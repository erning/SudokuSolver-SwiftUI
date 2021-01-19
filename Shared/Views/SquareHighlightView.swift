//
//  SquareHighlightView.swift
//  SudokuSolver
//
//  Created by Zhang Erning on 1/19/21.
//

import SwiftUI

struct SquareHighlightView: View {
    var highlight: Int

    var body: some View {
        GeometryReader { geometry in
            let width = min(geometry.size.width, geometry.size.height)
            let w: CGFloat = width / 9

            let colorBackground = Color(.systemGray).opacity(0.2)
            let colorSelected = Color(.systemBlue).opacity(0.2)

            if let hl = highlight {
                let (x, y) = (hl % 9, hl / 9)
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
        }
        .scaledToFit()
    }
}

struct SquareHighlightView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SquareHighlightView(highlight: 48)
            GridLinesView()
        }
    }
}
