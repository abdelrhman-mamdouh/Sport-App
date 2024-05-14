//
//  FavouriteViewModel.swift
//  SportSync
//
//  Created by Hussien on 13/05/2024.
//

import Foundation
class FavouriteViewModel{
    private let databaseHelper = DataBaseHelper.getInstance()
    var favouriteList : [LeagueDetails]
    init() {
        self.favouriteList = []
    }
    func addItem(newItem : LeagueDetails){
        databaseHelper?.addItemToDataBase(newItem: newItem)
    }
    
    func saveAllChanges(){
        databaseHelper?.saveAllChanges()
    }
    
    func featchData(completion : @escaping([LeagueDetails]?) -> Void){
        print("test Featch")
        favouriteList = databaseHelper?.getAllFavouriteItem() ?? []
        completion(favouriteList)
    }
    func searchForLeague(id:String,completion : @escaping([LeagueDetails]?) -> Void){
        completion(databaseHelper?.searchForALeague(id: id))
    }
    
    func getFavouriteList() -> [LeagueDetails]{
        
        return favouriteList
    }
    
    func deleteItemAt(index:Int){
        databaseHelper?.deleteItemAtIndex(id: index)
        favouriteList.remove(at: index)
    }
    
    
}
