//
//  LocalDataSource.swift
//  SportSync
//
//  Created by Hussien on 16/05/2024.
//

import Foundation
protocol LocalDataSource{
    func addItemToDataBase(newItem : LeagueDetails)
    func saveAllChanges()
    func searchForALeague(id:String) -> [LeagueDetails]
    func getAllFavouriteItem() -> [LeagueDetails]
    func deleteItemAtIndex(id :Int)
    func deleteItemWith(idObject:Int)
}
