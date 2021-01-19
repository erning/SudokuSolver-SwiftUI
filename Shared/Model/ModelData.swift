//
//  ModelData.swift
//  SudokuSolver
//
//  Created by Zhang Erning on 1/19/21.
//

import Foundation

class ModelData: ObservableObject {
    @Published var board = Board()
}

struct Board {
    var raw: [UInt8] = [UInt8](repeating: 0, count: 81)
    var given: [UInt8] = [UInt8](repeating: 0, count: 81)
    var guess: [UInt8] {
        var rv = self.raw
        for i in 0..<rv.count {
            if self.given[i] != 0 {
                rv[i] = 0
            }
        }
        return rv
    }
    var notes: [Int: [UInt8]] = [:]
}

let previewModelData: ModelData = {
    let m = ModelData()
    m.board.raw = [
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
    m.board.given = [
        0, 0, 0, 0, 0, 1, 5, 0, 9,
        0, 0, 0, 4, 0, 0, 0, 8, 0,
        0, 0, 0, 0, 0, 8, 0, 4, 7,
        0, 0, 0, 5, 0, 0, 8, 0, 1,
        0, 6, 0, 2, 8, 0, 0, 7, 4,
        0, 0, 0, 0, 0, 0, 0, 3, 0,
        0, 0, 0, 9, 0, 2, 0, 0, 0,
        4, 0, 5, 7, 0, 6, 0, 0, 0,
        0, 0, 0, 0, 5, 0, 0, 0, 0,
    ]
    m.board.notes = [
        0: [3, 6, 8],
        57: [1, 3],
        80: [3, 6, 8],
    ]

    return m
}()
