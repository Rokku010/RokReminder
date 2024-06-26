//
//  ReminderCellView.swift
//  RokReminder
//
//  Created by Quốc Lộc on 30/05/2024.
//

import SwiftUI

struct ReminderCellView: View {
    
    let reminder: Reminder
    @State private var checked: Bool = false
    
    private func formatDate(_ date: Date)-> String{
        if date.isToday{
            return "Today"
        } else if date.isTomorrow{
            return "tomorrow"
        } else{
            return date.formatted(date:.numeric, time: .omitted)
        }
    }
    
    var body: some View {
        HStack{
            Image(systemName: checked ? "circle.inset.filled": "circle")
                .font(.title)
                .opacity(0.4)
                .onTapGesture {
                    checked.toggle()
                }
            
            VStack(alignment: .leading){
                Text(reminder.title ?? "")
                if let notes = reminder.notes, !notes.isEmpty {
                    Text(notes)
                        .opacity(0.4)
                        .font(.caption)
                }
                    
                HStack{
                    if let reminderDate = reminder.reminderDate{
                        Text(formatDate(reminderDate))
                    }
                    
                    if let reminderTime = reminder.reminderTime {
                        Text(reminderTime.formatted(date: .omitted, time: .shortened))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.caption)
                .opacity(0.5)
            }
        }
    }
}

#Preview {
    ReminderCellView(reminder: PreviewData.reminder)
}
