//
//  Date+Extensions.swift
//  RokReminder
//
//  Created by Quốc Lộc on 30/05/2024.
//

import Foundation

extension Date{
    var isToday: Bool{
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }
    var isTomorrow: Bool{
        let calendar = Calendar.current
        return calendar.isDateInTomorrow(self)
    }
    
    var dataComponents: DateComponents{
        Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self)
    }
}
