//
//  RokReminderApp.swift
//  RokReminder
//
//  Created by Quốc Lộc on 27/05/2024.
//

import SwiftUI

@main
struct RokReminderApp: App {
     var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
        }
    }
}
