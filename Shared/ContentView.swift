//
//  ContentView.swift
//  Shared
//
//  Created by Zhang Erning on 1/18/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                BoardView()
                Spacer()
                HStack {
                    Button(action: {
                        print("Edit button was tapped")
                    }) {
                        VStack(spacing: 10) {
                            Image(systemName: "arrowshape.turn.up.left")
                            Text("Undo")
                        }
                    }
                    Spacer()
                    Button(action: {
                        print("Edit button was tapped")
                    }) {
                        VStack(spacing: 10) {
                            Image(systemName: "clear")
                            Text("Erase")
                        }
                    }
                    Spacer()

                    Button(action: {
                        print("Edit button was tapped")
                    }) {
                        VStack(spacing: 10) {
                            Image(systemName: "pencil.and.ellipsis.rectangle")
                            Text("Note")
                        }
                    }
                    Spacer()

                    Button(action: {
                        print("Edit button was tapped")
                    }) {
                        VStack(spacing: 10) {
                            Image(systemName: "arrowshape.turn.up.left")
                            Text("Hint")
                        }
                    }
                }
                Spacer()
                HStack {
                    ForEach(1..<10) { i in

                        Button(action: {

                        }) {
                            Image(systemName: "\(i).square.fill").resizable()
                        }
                        .frame(width: 36, height: 36)

                    }

                }
                Spacer()
                Button("HELLO") {

                }
            }
        }
        .navigationTitle("Landmarks")
        .padding()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //                    .preferredColorScheme(.dark)
    }
}
