//
//  CustomEventList.swift
//  ReformLuach
//
//  Created by u-sss18 on 11/17/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit
import Foundation
import CoreData
//import EventDataService

class CustomEventList: UIViewController , UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate, UISearchBarDelegate, UISearchControllerDelegate{

    var fetchedResultsController : NSFetchedResultsController<Myevent>!
    var bookToDelete:Myevent?
    var coreData = CoreDataStack1()
    let moc = NSManagedObjectContext()
    
    var arrList = NSArray()
    var loadList = NSArray()
    
    
    @IBOutlet weak var CustomHeaderImage: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tblView: UITableView!
    
   
    @IBOutlet weak var No_result: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        searchBar.delegate = self;
        
        
        

        // Do any additional setup after loading the view.
    }
    
//    func swipeLeft() {
//        let total = self.tabBarController!.viewControllers!.count - 1
//        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex + 1)
//        
//    }
//    
//    func swipeRight() {
//        tabBarController!.selectedIndex = max(0, tabBarController!.selectedIndex - 1)
//    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    override func viewWillLayoutSubviews()
    {
        let userdefaults = UserDefaults.standard

        
        if UserDefaults.standard.object(forKey: "CustomLst") != nil
        {
            arrList = userdefaults.array(forKey: "CustomLst")! as NSArray
            loadList = arrList;
            No_result.isHidden = true;
        }
        else
        {
            No_result.isHidden = false;
//            arrCustomList .add(myLocalDic)
//            UserDefaults.standard.set(arrCustomList, forKey: "CustomLst")
            
        }
        
//        loadData()
        tblView.reloadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func b(_ sender: UIButton)
    {
         self .dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews()
    {
        
        let strImageMoth = Int(UserDefaults.standard.integer(forKey: "monthImageNo"))
        myBackGraound(strmonth: strImageMoth)
    }
    
    func myBackGraound(strmonth: NSInteger)
    {
        let strimagename = "commanHeader" + "\(strmonth)"
        CustomHeaderImage.image = UIImage(named: strimagename)
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! customCell
        
         let dicc = arrList[indexPath.row] as! [String : Any]
        
  //      cell.lblEvntTitle.text = arrList .value(forKey: <#T##String#>)[indexPath.row]
//        cell.lblEvntDate.text = arrList[indexPath.row]
        
        cell.lblEvntTitle.text = String (describing: dicc["Title"]!)
            /*    cell.lblEvntDate.text = String (describing: dicc["Startdate"]!)*/
        
        return cell
    }
    
//    private func loadData()
//    {
////        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Myevent")
//
//
////        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Myevent")
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Myevent")
//
//
//        // Add Sort Descriptor
////        let sortDescriptor = NSSortDescriptor(key: "eventStartDate", ascending: true)
////        fetchRequest.sortDescriptors = [sortDescriptor]
//        do {
//
//            let records = try moc.fetch(fetchRequest) as! [Myevent]
//            for record in records
//            {
//                print((record as AnyObject).value(forKey: "eventStartDate") ?? "no name")
//            }
//        }
//        catch
//        {
//                fatalError("Failed to fetch employees: \(error)")
//        }
////            let records = try NSManagedObjectContext.fetch(fetchRequest) as! Array
////
////            for record in records {
////                print(record.value(forKey: "eventStartDate") ?? "no name")
////            }
//
//
////        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
////        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Myevent")
////
////        do {
////            let results = try context.fetch(fetchRequest)
//////            let  dateCreated = results as! [PhotoData]
////
//////            for _datecreated in dateCreated {
//////                print(_datecreated.dateCreation!)
//////                onlyDateArr.append(_datecreated)
//////            }
////        }catch let err as NSError {
////            print(err.debugDescription)
////        }
//
////        fetchedResultsController = EventDataService1.getEvents(managedObjectContext: coreData.persistentContainer.viewContext)
////        fetchedResultsController.delegate = self
//    }
//
    


//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
//    {
//
//    }
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
//    {
//
//        let predicate = NSPredicate(format: "%K CONTAINS[cd] %@ ", "Title", searchText )
//        // NSArray *temp = [bookCollection filteredArrayUsingPredicate:predicate];
//         arrList = (loadList as NSArray).filtered(using: predicate) as NSArray
//
//        if searchText == "" || searchText == nil
//        {
//            arrList = loadList;
//        }
//        
//        tblView.reloadData()
//    }
//    
//    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
//    {
//        return true;
//    }
//        
//    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
//    {
//        arrList = loadList;
//    }
//    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
//    {
//        let predicate = NSPredicate(format: "%K CONTAINS[cd] %@ ", "Title", searchBar.text! )
//        // NSArray *temp = [bookCollection filteredArrayUsingPredicate:predicate];
//        arrList = (loadList as NSArray).filtered(using: predicate) as NSArray
//        
//        
//        
//        tblView.reloadData()
//    }
    
}
