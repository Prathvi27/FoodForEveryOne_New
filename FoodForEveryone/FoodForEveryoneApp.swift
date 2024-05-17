//
//  FoodForEveryoneApp.swift
//  FoodForEveryone
//
//  Created by Ketaki Ekatpure on 11/5/2024.
//

import SwiftUI

@main
struct FoodForEveryoneApp: App {
    var body: some Scene {
        WindowGroup {
            StartView()
//          NavigationBarView()
            .environmentObject(CartManager())
        }
    }
}
