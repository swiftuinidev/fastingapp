//
//  fastingappApp.swift
//  fastingapp
//
//  Created by David Buckley on 09/06/2022.
//

import SwiftUI

@main
struct fastingappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
