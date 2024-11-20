//
//  AddView.swift
//  iExpense
//
//  Created by Sean Dooley on 12/11/2024.
//

import SwiftUI

struct AddView: View {
    var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        if let amountValue = Double(amount) {
                            let item = ExpenseItem(name: name, type: type, amount: amountValue)
                            expenses.items.append(item)
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
