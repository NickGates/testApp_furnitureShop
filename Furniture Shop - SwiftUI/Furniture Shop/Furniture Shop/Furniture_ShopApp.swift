//
//  Furniture_ShopApp.swift
//  Furniture Shop
//
//  Created by Nikita on 14.04.2023.
//

import SwiftUI

@main
struct Furniture_ShopApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
