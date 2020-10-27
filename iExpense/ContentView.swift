//
//  ContentView.swift
//  iExpense
//
//  Created by Amber Spadafora on 10/26/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    var body: some View {
        VStack {
            List {
                ForEach(self.numbers, id: \.self) {
                    Text("\($0)")
                }
            }
            Button("Add Number") {
                self.numbers.append(self.currentNumber)
                self.currentNumber += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
