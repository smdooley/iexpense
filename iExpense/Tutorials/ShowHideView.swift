//
//  ShowHideView.swift
//  iExpense
//
//  Created by Sean Dooley on 12/11/2024.
//

import SwiftUI

struct ShowHideView: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "@smdool")
        }
    }
}

#Preview {
    ShowHideView()
}

struct SecondView: View {
    let name: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Hello, \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}
