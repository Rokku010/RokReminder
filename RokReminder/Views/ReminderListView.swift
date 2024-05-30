//
//  ReminderListView.swift
//  RokReminder
//
//  Created by Quốc Lộc on 30/05/2024.
//

import SwiftUI

struct ReminderListView: View {
    
    let reminders: FetchedResults<Reminder>
    
    var body: some View {
        List(reminders){ reminder in
            ReminderCellView(reminder: reminder)
        }
    }
}

//#Preview {
//    ReminderListView()
//}
