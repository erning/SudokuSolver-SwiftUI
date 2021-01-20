//
//  BoardView.swift
//  SudokuSolver
//
//  Created by Zhang Erning on 1/19/21.
//

import SwiftUI

struct BoardView: View {
    @State var selectedIndex: Int = 0

    @State var mode: Mode = .ready
    @State var index: Int = 0
    @State var numbers: [UInt8] = [UInt8](repeating: 0, count: 81)
    @State var given: Set<Int> = []
    @State var notes: [Int: [UInt8]] = [:]

    @State var solver: Solver? = nil
    @State var waitus: Double = 0

    var progress: Float {
        var count = 0
        for i in 0..<self.numbers.count {
            if self.numbers[i] != 0 {
                count += 1
            }
        }
        let total = 81
        return Float(count) / Float(total)
    }

    var body: some View {
        VStack {
            Text("Sudoku Solver")
                .font(.largeTitle)
            Spacer()
            ProgressView(value: self.progress)
            ZStack {
                GridView(
                    numbers: self.numbers,
                    given: self.given,
                    notes: self.notes
                )
                if mode == .edit {
                    GridEditView(index: self.$selectedIndex)
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            Divider()
            HStack {
                Spacer()
                switch mode {
                case .ready:
                    button("Start", "wand.and.stars", actionStart)
                    Spacer()
                    button("Edit", "square.and.pencil", actionEdit)
                case .edit:
                    button("Clear", "xmark.bin", actionEditClear)
                    Spacer()
                    button("Done", "checkmark.square", actionEditDone)
                case .solving:
                    button("Next", "checkmark.square", actionSolveNext)
                    Spacer()
                    button("Finish", "checkmark.square", actionSolveFinish)
                }
                Spacer()
            }
            Slider(value: $waitus, in: 0...100, step: 1)
            Spacer()
            GridEditKeyboardView(
                index: self.$selectedIndex,
                numbers: self.$numbers,
                mode: self.mode
            )
            .padding()
            Spacer()
        }
    }

    func button(_ text: String, _ image: String, _ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: image)
                Text(text)
            }
        }
        .padding()
    }

    func actionStart() {
        for i in 0..<self.numbers.count {
            if !self.given.contains(i) {
                self.numbers[i] = 0
            }
        }
        let grid = Grid(self.numbers)
        if !grid.isValid {
            return
        }
        self.solver = Solver(grid)
        self.mode = .solving
        self.notes = [:]

        DispatchQueue.global().async {
            var rv = self.solveNext()
            repeat {
                if self.waitus > 0 {
                    DispatchQueue.main.sync {
                        rv = self.solveNext()
                    }
                    usleep(UInt32(100 - self.waitus) * 1000 * 10)
                } else {
                    usleep(1000 * 1000)
                }
            } while rv
        }
    }

    func actionEdit() {
        given.removeAll()
        self.mode = .edit
        self.notes = [:]
    }

    func actionEditClear() {
        self.selectedIndex = 0
        self.numbers = [UInt8](repeating: 0, count: 81)
        self.notes = [:]
    }

    func actionEditDone() {
        self.given.removeAll()
        for i in 0..<self.numbers.count {
            if self.numbers[i] > 0 {
                self.given.insert(i)
            }
        }
        self.mode = .ready
    }

    func actionSolveNext() {
        self.solveNext()
    }

    func solveNext() -> Bool {
        if let solver = self.solver {
            if let grid = solver.next() {
                self.numbers = grid.raw
                var notes: [Int: [UInt8]] = [:]
                for state in solver.states {
                    notes[state.i] = state.pn
                }
                self.notes = notes
                return true
            } else {
                self.notes = [:]
                self.mode = .ready
                return false
            }
        }
        return false
    }

    func actionSolveFinish() {
        if let solver = self.solver {
            for grid in solver {
                self.numbers = grid.raw
            }
        }
        self.notes = [:]
        self.mode = .ready
    }

    enum Mode {
        case ready, edit, solving
    }
}

struct GridEditView: View {
    @Binding var index: Int

    var body: some View {
        GeometryReader { geometry in
            let width = min(geometry.size.width, geometry.size.height)
            let w: CGFloat = width / 9

            ForEach(0..<81) { i in
                let (x, y) = (CGFloat(i % 9), CGFloat(i / 9))
                // square
                Color.blue.opacity(i == self.index ? 0.2 : 0.01)
                    .offset(x: x * w, y: y * w)
                    .frame(width: w, height: w)
                    .onTapGesture {
                        self.index = i
                    }
            }
        }
        .scaledToFit()
    }
}

struct GridEditKeyboardView: View {
    @Binding var index: Int
    @Binding var numbers: [UInt8]
    var mode: BoardView.Mode

    var body: some View {
        VStack {
            HStack {
                button(0)
                button(1)
                button(2)
                button(3)
                button(4)
            }
            HStack {
                button(5)
                button(6)
                button(7)
                button(8)
                button(9)
            }
        }
    }

    func fill(_ v: UInt8) {
        self.numbers[self.index] = v
        self.index += 1
        self.index %= 81
    }

    func button(_ v: UInt8) -> some View {
        let name: String = {
            if v == 0 {
                return "clear.fill"
            } else {
                return "\(v).square.fill"
            }
        }()
        return Button(action: {
            fill(v)
        }) {
            Image(systemName: name)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .disabled(mode != .edit)
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
    }
}
