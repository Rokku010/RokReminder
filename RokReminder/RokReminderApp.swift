//
//  RokReminderApp.swift
//  RokReminder
//
//  Created by Quốc Lộc on 27/05/2024.
//

import SwiftUI

@main
struct RokReminderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
