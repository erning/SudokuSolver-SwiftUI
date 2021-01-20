//
//  BoardEditView.swift
//  SudokuSolver
//
//  Created by Zhang Erning on 1/19/21.
//

import SwiftUI

struct GridView: View {
    var numbers: [UInt8] = [UInt8](repeating: 0, count: 81)
    var given: Set<Int> = []
    var notes: [Int: [UInt8]] = [:]

    var body: some View {
        ZStack {
            GridNumbersView(numbers: self.numbers, given: self.given)
            GridNotesView(notes: self.notes)
            GridLinesView()
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(
            numbers: GridNumbersView_Previews.numbers,
            given: GridNumbersView_Previews.given,
            notes: GridNotesView_Previews.notes
        )
        .padding()
    }
}
