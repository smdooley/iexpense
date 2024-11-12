//
//  UsingStateWithClassesView.swift
//  iExpense
//
//  Created by Sean Dooley on 12/11/2024.
//

import SwiftUI

struct UsingStateWithClassesView: View {
    @State private var user = User()

    var body: some View {
        VStack(spacing: 10) {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    UsingStateWithClassesView()
}

//struct User {
@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}
