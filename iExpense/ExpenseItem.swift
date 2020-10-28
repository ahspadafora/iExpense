//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Amber Spadafora on 10/27/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
