//
//  ContentView.swift
//  iExpense
//
//  Created by Sean Dooley on 12/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.groupedByType.keys.sorted(), id: \.self) { type in
                    Section(type) {
                        ForEach(expenses.groupedByType[type] ?? []) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundColor(item.amount < 10.0 ? /*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/ : item.amount < 100 ? .orange : .red)
                            }
                        }
                        .onDelete { offsets in
                            removeItems(at: offsets, ofType: type)
                        }
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
//                Button("Add expense", systemImage: "plus") {
//                    showingAddExpense = true
//                }
                NavigationLink(destination: AddView(expenses: expenses)
                    .navigationBarBackButtonHidden(true)) {
                    Label("Add expense", systemImage: "plus")
                }
            }
        }
//        .sheet(isPresented: $showingAddExpense) {
//            AddView(expenses: expenses)
//        }
    }
    
    func removeItems(at offsets: IndexSet, ofType type: String) {
        expenses.items.removeAll { item in
            if let index = expenses.items.firstIndex(where: { $0.id == item.id }) {
                return item.type == type && offsets.contains(index)
            }
            return false
        }
    }
}

extension Expenses {
    var groupedByType: [String: [ExpenseItem]] {
        Dictionary(grouping: items, by: { $0.type })
    }
}

#Preview {
    ContentView()
}


