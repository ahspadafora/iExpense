//
//  AddView.swift
//  iExpense
//
//  Created by Amber Spadafora on 10/27/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @State private var isShowingAlert = false
    
    @ObservedObject var expenses: Expenses
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount).keyboardType(.numberPad)
            }
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Please enter a valid amount"), message: Text("Please enter a number for the amount"), dismissButton: .default(Text("OK")))
        }
        .navigationBarTitle("Add new expense")
        .navigationBarItems(trailing:
            Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                    
                } else {
                    self.isShowingAlert = true
                    self.amount = ""
                }
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
