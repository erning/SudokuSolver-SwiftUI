//
//  BoardEditView.swift
//  SudokuSolver
//
//  Created by Zhang Erning on 1/19/21.
//

import SwiftUI

struct BoardEditView: View {
    @State var highlight: Int? = nil
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        ZStack {
            GridNotesView(notes: modelData.board.notes)
            GridNumbersView(numbers: modelData.board.raw)
            GridLinesView()
        }
    }
}

struct BoardEditView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .padding()
            .environmentObject(previewModelData)
    }
}
