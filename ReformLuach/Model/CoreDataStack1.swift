//
//  CoreDataStack1.swift
//  ReformLuach
//
//  Created by u-sss18 on 11/18/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit
import CoreData

class CoreDataStack1: NSObject
{
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "customData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
