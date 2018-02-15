//
//  AppDelegate.swift
//  ReformLuach
//
//  Created by u-sss18 on 8/22/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit
import CoreData
import Fabric
import Crashlytics
import KYDrawerController

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var coreData = CoreDataStack1()
    let drawerController = KYDrawerController(drawerDirection: .right, drawerWidth: 260.0)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        openSettings(true)
       Fabric.with([Crashlytics.self])
            

        if UserDefaults.standard.object(forKey: "CCTYPE") != nil
        {
            let btnTagValue = UserDefaults.standard.string(forKey: "CCTYPE")! as String
            print(btnTagValue)
        }
        else
        {
            let ad = "REFORM"
            UserDefaults.standard.setValue("\(ad)", forKey: "CCTYPE")
        }
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
//        checkDataStore()
        return true
    }
    
    func openSettings(_ animated: Bool) {
        
        let mainViewController   = Utils.getMainNVC()
        let drawerViewController = Utils.getSettingVC()
        drawerController.mainViewController = mainViewController
        drawerController.drawerViewController = drawerViewController
        window?.rootViewController?.present(drawerController, animated: animated, completion: nil)
    }
       
    func applicationWillResignActive(_ application: UIApplication)
    {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication)
    {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//        self.saveContext()
        coreData.saveContext()
    }

    var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
//    func checkDataStore() {
//        if #available(iOS 10.0, *) {
//            let moc = coreData.persistentContainer.viewContext
//        } else {
//            // Fallback on earlier versions
//        }
//        let request: NSFetchRequest<Myevent> = Myevent.fetchRequest()
//
//        do {
//            let bookCount = try moc.count(for: request)
//
//            if bookCount == 0 {
////                uploadSampleData()
//            }
//        }
//        catch {
//            fatalError("Error in counting movie")
//        }
//    }
    
//    func uploadSampleData() {
//        let moc = coreData.persistentContainer.viewContext
//        let url = Bundle.main.url(forResource: "books", withExtension: "json")
//        let data = NSData(contentsOf: url!)
//
//        do {
//            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
//            let jsonArray = jsonResult.value(forKey: "books") as! NSArray
//
//            for json in jsonArray {
//                let bookData = json as! [String: AnyObject]
//                let cusevent = Myevent(context: moc)
//
//                guard let name = bookData["name"] else {
//                    return
//                }
//                cusevent.eventTitle = name as? String
//
//                guard let rating = bookData["rating"] else {
//                    return
//                }
//                cusevent.eventStartDate = rating.int16Value
//
//                guard let author = bookData["author"] else {
//                    return
//                }
//                cusevent.eventEndDate = author as? String
//
//                guard let author = bookData["author"] else {
//                    return
//                }
//                cusevent.eventRepeat = author as? String
//
////                var image: UIImage?
////                if let bookImage = bookData["image"] {
////                    let imageName = bookImage as? String
////                    image = UIImage(named: imageName!)
////                    book.image = NSData.init(data: UIImageJPEGRepresentation(image!, 1)!) as Data
////                }
//            }
//
//            coreData.saveContext()
//        }
//        catch {
//            fatalError("Cannot upload sample data")
//        }
//    }
    
    // MARK: - Core Data stack
//
//    lazy var persistentContainer: NSPersistentContainer = {
//        /*
//         The persistent container for the application. This implementation
//         creates and returns a container, having loaded the store for the
//         application to it. This property is optional since there are legitimate
//         error conditions that could cause the creation of the store to fail.
//         */
//        let container = NSPersistentContainer(name: "customData")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//
//                /*
//                 Typical reasons for an error here include:
//                 * The parent directory does not exist, cannot be created, or disallows writing.
//                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                 * The device is out of space.
//                 * The store could not be migrated to the current model version.
//                 Check the error message to determine what the actual problem was.
//                 */
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    // MARK: - Core Data Saving support
//
//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
    // MARK: - Core Data stack
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.appcoda.CoreDataDemo" in the application's documents Application Support directory.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1] as NSURL
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = Bundle.main.url(forResource: "customData", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
        
    }()
    lazy var managedObjectContext: NSManagedObjectContext = {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType);        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    
    }()
    
//    lazy var persistentContainer: NSPersistentContainer = {
//        /*
//         The persistent container for the application. This implementation
//         creates and returns a container, having loaded the store for the
//         application to it. This property is optional since there are legitimate
//         error conditions that could cause the creation of the store to fail.
//         */
//        let container = NSPersistentContainer(name: "customData")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//
//                /*
//                 Typical reasons for an error here include:
//                 * The parent directory does not exist, cannot be created, or disallows writing.
//                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                 * The device is out of space.
//                 * The store could not be migrated to the current model version.
//                 Check the error message to determine what the actual problem was.
//                 */
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("CoreDataDemo.sqlite")
        
        // Load the existing database
        if !FileManager.default.fileExists(atPath: url!.path) {
            let sourceSqliteURLs = [Bundle.main.url(forResource: "CoreDataDemo", withExtension: "sqlite"),Bundle.main.url(forResource: "CoreDataDemo", withExtension: "sqlite-wal"),Bundle.main.url(forResource: "CoreDataDemo", withExtension: "sqlite-shm")]
            //            let sourceSqliteURLs = [BundleBundle.mainBundle().URLForResource("CoreDataDemo", withExtension: "sqlite")!, Bundle.mainBundle().URLForResource("CoreDataDemo", withExtension: "sqlite-wal")!, NSBundle.mainBundle().URLForResource("CoreDataDemo", withExtension: "sqlite-shm")!]
            let destSqliteURLs = [self.applicationDocumentsDirectory.appendingPathComponent("CoreDataDemo.sqlite"), self.applicationDocumentsDirectory.appendingPathComponent("CoreDataDemo.sqlite-wal"), self.applicationDocumentsDirectory.appendingPathComponent("CoreDataDemo.sqlite-shm")]
            
            //            for var index = 0; index < sourceSqliteURLs.count; index++ {
            for index in 0 ... sourceSqliteURLs.count-1
            {
                do {
                    try FileManager.default.copyItem(at: sourceSqliteURLs[index]!, to: destSqliteURLs[index]!)
                } catch {
                    print(error)
                }
            }
        }
        
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

