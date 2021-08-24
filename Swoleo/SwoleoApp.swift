//
//  SwoleoApp.swift
//  Swoleo
//
//  Created by Sami Amer on 8/24/21.
//

import SwiftUI

@main
struct SwoleoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
