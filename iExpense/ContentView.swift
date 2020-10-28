//
//  ContentView.swift
//  iExpense
//
//  Created by Amber Spadafora on 10/26/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name).font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                    }
                }.onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            
            .navigationBarItems(trailing:
                HStack {
                    EditButton()
                    Spacer()
                    Button(action: {
                        self.showingAddExpense = true
                    }) {
                        Image(systemName: "plus")
                    }
                    
                    
                }
                
            )
            
        }.sheet(isPresented: $showingAddExpense) {
            AddView(expenses: self.expenses)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
