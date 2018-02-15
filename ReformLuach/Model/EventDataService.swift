//
//  EventDataService.swift
//  ReformLuach
//
//  Created by u-sss18 on 11/17/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import Foundation
import CoreData

class EventDataService: NSObject
{
    
    internal static func getEvents(managedObjectContext:NSManagedObjectContext) -> NSFetchedResultsController<Myevent> {
        let fetchedResultController: NSFetchedResultsController<Myevent>
        
        let request: NSFetchRequest<Myevent> = Myevent.fetchRequest()
        let sort = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sort]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try fetchedResultController.performFetch()
        }
        catch {
            fatalError("Error in fetching records")
        }
        
        return fetchedResultController
    }
}
