//
//  Mylist+CoreDataProperties.swift
//  RokReminder
//
//  Created by Quốc Lộc on 27/05/2024.
//

import Foundation
import CoreData
import UIKit

extension MyList{
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList>{
        return  NSFetchRequest<MyList>(entityName: "MyList")
        
    }
    
    @NSManaged public var name: String
    @NSManaged public var color: UIColor
    @NSManaged public var reminders: NSSet?
}

extension MyList: Identifiable{
    
}
// MARK: Generated accessors for nores
extension MyList{
    @objc(addRemindersObject:)
    @NSManaged public func addToReminders(_ value: Reminder)
    
    @objc(removeRemindersOnject:)
    @NSManaged public func removeFromReminders(_ value: Reminder)
    
    @objc(addReninders:)
    @NSManaged public func AddToReminders(_ value: NSSet)
    
    @objc(removeReminders:)
    @NSManaged public func removeFromReminders(_ value: NSSet)
}
