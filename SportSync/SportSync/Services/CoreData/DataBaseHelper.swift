//
//  DataBaseHelper.swift
//  SportSync
//
//  Created by Hussien on 13/05/2024.
//

import Foundation
import UIKit
import CoreData
class DataBaseHelper{
    private var appdeleget : AppDelegate
    private var managedContext :NSManagedObjectContext
    private var leagueData : [NSManagedObject]?
    private static var instance:DataBaseHelper? = nil
    private var favLeaguesList:[LeagueDetails]?
    private init() {
        self.appdeleget = (UIApplication.shared.delegate as? AppDelegate)!
        self.managedContext = (appdeleget.persistentContainer.viewContext)
     
    }
    
    static func getInstance()  -> DataBaseHelper?{
        if instance != nil{
            return instance
        }else{
            instance = DataBaseHelper()
            return instance
        }
    }
    
    func addItemToDataBase(newItem : LeagueDetails){

        print("item title \(newItem.title)")
        let entity = NSEntityDescription.entity(forEntityName: "FavLeagues", in: managedContext)
        
        let FavLeagues = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        FavLeagues.setValue(newItem.title, forKey: "title")
        FavLeagues.setValue(newItem.id, forKey: "id")
        FavLeagues.setValue(newItem.country, forKey: "country")
        FavLeagues.setValue(newItem.logo, forKey: "logo")
        FavLeagues.setValue(newItem.sport, forKey: "sport")
        
        saveAllChanges()
        
    }
    
    func saveAllChanges(){
        do {
            
            try managedContext.save()
            print("saved!")
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    func searchForALeague(id:String) -> [LeagueDetails]{
        var currentItem :[LeagueDetails] = []
        print("offline")
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavLeagues")
        let myPredicate = NSPredicate(format: "id == %@",id)
        fetchRequest.predicate = myPredicate
        favLeaguesList = []
        do{
            leagueData = try managedContext.fetch(fetchRequest)
            print("FavLeagues count \(leagueData?.count ?? 0)")
            for item in leagueData! {
                currentItem.append(LeagueDetails(id: item.value(forKey: "id") as! String, title: item.value(forKey: "title") as! String, logo: item.value(forKey: "logo") as! String, country: item.value(forKey: "country") as! String , sport: item.value(forKey: "sport") as! String))
            }
            print("favLeage count \(currentItem.count)")
           
        }catch let error as NSError{
            
            print(error)
        }
        return currentItem 
        
    }
    func getAllFavouriteItem() -> [LeagueDetails]{
        print("offline")
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavLeagues")
        favLeaguesList = []
        do{
            leagueData = try managedContext.fetch(fetchRequest)
            print("FavLeagues count \(leagueData?.count ?? 0)")
            for item in leagueData! {
                favLeaguesList?.append(LeagueDetails(id: item.value(forKey: "id") as! String, title: item.value(forKey: "title") as! String, logo: item.value(forKey: "logo") as! String, country: item.value(forKey: "country") as! String , sport: item.value(forKey: "sport") as! String))
            }
            print("favLeage count \(favLeaguesList?.count)")
           
        }catch let error as NSError{
            
            print(error)
        }
        return favLeaguesList ?? []
        
    }
    
    
    func deleteItemAtIndex(id :Int){
        managedContext.delete((leagueData?[id])!)
        favLeaguesList?.remove(at: id)
        saveAllChanges()
    }
    func deleteItemWith(idObject:Int){
        _ = self.getAllFavouriteItem()
        let index = favLeaguesList?.firstIndex(where: {Int($0.id) == idObject}) ?? 0
        print("testing of index \(index)")
        managedContext.delete((leagueData?[index])!)
        favLeaguesList?.remove(at: index)
        saveAllChanges()
        
    }
}
