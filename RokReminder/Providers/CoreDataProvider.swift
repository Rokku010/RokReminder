//
//  CoreDataProvider.swift
//  RokReminder
//
//  Created by Quốc Lộc on 27/05/2024.
//

import Foundation
import CoreData

class CoreDataProvider{
    
    static let shared = CoreDataProvider()
    
    let persistentContainer: NSPersistentContainer
    //: chứa toàn bộ Core Data stack bao gồm mô hình dữ liệu (data model), bộ lưu trữ (persistent store), và bộ ngữ cảnh (managed object context).
    
    private init(){
        //register transformers
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
        
        persistentContainer = NSPersistentContainer(name: "ReminderModel")
        persistentContainer.loadPersistentStores{ description, error in
            if let error {
                fatalError("Error initializing RemindersModel \(error)")
            }
        }
    }
}
