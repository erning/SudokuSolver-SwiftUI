//
//  GridNumbersView.swift
//  SudokuSolver
//
//  Created by Zhang Erning on 1/19/21.
//

import SwiftUI

struct GridNumbersView: View {
    var numbers: [UInt8]
    var style: Style = .none

    var body: some View {
        GeometryReader { geometry in
            let width = min(geometry.size.width, geometry.size.height)
            let w: CGFloat = width / 9

            ForEach(0..<81) { i in
                let (x, y) = (CGFloat(i % 9), CGFloat(i / 9))
                let v = self.numbers[i]

                if v > 0 {
                    Text("\(v)")
                        .font(.system(size: w / 2.2, design: .monospaced))
                        .foregroundColor(self.style.fgColor)
                        .frame(width: w, height: w)
                        .background(self.style.bgColor)
                        .offset(x: x * w, y: y * w)
                }
            }
        }
        .scaledToFit()
    }

    enum Style {
        case none, given, guess

        var fgColor: Color {
            switch self {
            case .given:
                return Color.secondary
            default:
                return Color.primary
            }
        }

        var bgColor: Color {
            switch self {
            case .given:
                return Color(.systemGray6)
            default:
                return Color.white.opacity(0)
            }
        }
    }
}

struct GridNumbersView_Previews: PreviewProvider {
    static var previews: some View {
        GridNumbersView(
            numbers: previewModelData.board.raw
        )
        .padding()
    }
}
