//
//  CoreExternalDataApp.swift
//  CoreExternalData
//
//  Created by Isidoro Fiore on 7/15/21.
//

import SwiftUI

@main
struct CoreExternalDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
