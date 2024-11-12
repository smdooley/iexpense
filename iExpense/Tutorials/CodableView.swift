//
//  CodableView.swift
//  iExpense
//
//  Created by Sean Dooley on 12/11/2024.
//

import SwiftUI

struct CodableView: View {
    @State private var member = Member(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()

            if let data = try? encoder.encode(member) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    CodableView()
}

struct Member: Codable {
    let firstName: String
    let lastName: String
}
