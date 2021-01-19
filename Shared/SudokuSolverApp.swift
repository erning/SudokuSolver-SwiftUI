//
//  SudokuSolverApp.swift
//  Shared
//
//  Created by Zhang Erning on 1/18/21.
//

import SwiftUI

@main
struct SudokuSolverApp: App {
    var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
