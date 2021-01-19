//
//  BoardView.swift
//  SudokuSolver
//
//  Created by Zhang Erning on 1/19/21.
//

import SwiftUI

struct BoardView: View {
    @State var highlight: Int? = nil
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        ZStack {
            GridNumbersView(numbers: modelData.board.given, style: .given)
            GridNumbersView(numbers: modelData.board.guess, style: .guess)
            GridNotesView(notes: modelData.board.notes)
            if let i = highlight {
                SquareHighlightView(highlight: i)
            }
            GridLinesView()
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BoardView()
                .padding()

            BoardView()
                .padding()
                .preferredColorScheme(.dark)
        }
        .environmentObject(previewModelData)
    }
}

//                    .onTapGesture {
//                        if self.selected == nil || self.selected! != i {
//                            self.selected = i
//                        } else {
//                            self.selected = nil
//                        }
//                    }
