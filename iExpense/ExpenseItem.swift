//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Sean Dooley on 12/11/2024.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
