//
//  UserDefaultsView.swift
//  iExpense
//
//  Created by Sean Dooley on 12/11/2024.
//

import SwiftUI

struct UserDefaultsView: View {
    //@State private var tapCount = UserDefaults.standard.integer(forKey: "tap")
    
    @AppStorage("tap") private var tapCount = 0

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            //UserDefaults.standard.set(tapCount, forKey: "tap")
        }
    }
}

#Preview {
    UserDefaultsView()
}
