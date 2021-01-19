//
//  GridLinesView.swift
//  SudokuSolver
//
//  Created by Zhang Erning on 1/18/21.
//

import SwiftUI

struct GridLinesView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = min(geometry.size.width, geometry.size.height)
            let w: CGFloat = width / 9

            let colorLight = Color(.systemGray4)
            let colorDark = Color(.systemGray2)
            let colorBorder = Color(.systemGray)

            Path { path in
                for i: CGFloat in [1, 2, 4, 5, 7, 8] {
                    path.addLines([
                        CGPoint(x: w * i, y: 0),
                        CGPoint(x: w * i, y: w * 9),
                    ])
                    path.addLines([
                        CGPoint(x: 0, y: w * i),
                        CGPoint(x: w * 9, y: w * i),
                    ])
                }
            }
            .stroke(colorLight)

            Path { path in
                for i: CGFloat in [3, 6] {
                    path.addLines([
                        CGPoint(x: w * i, y: 0),
                        CGPoint(x: w * i, y: w * 9),
                    ])
                    path.addLines([
                        CGPoint(x: 0, y: w * i),
                        CGPoint(x: w * 9, y: w * i),
                    ])
                }
            }
            .stroke(colorDark, lineWidth: 1.5)

            Path { path in
                path.addRect(CGRect(x: 0, y: 0, width: w * 9, height: w * 9))
            }
            .stroke(colorBorder, lineWidth: 2)
        }
        .scaledToFit()
    }
}

struct GridLinesView_Previews: PreviewProvider {
    static var previews: some View {
        GridLinesView()
            .padding()
    }
}
