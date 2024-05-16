//
//  FavouriteProtocol.swift
//  SportSync
//
//  Created by Hussien on 16/05/2024.
//

import Foundation
protocol FavouriteProtocol{
    func addItem(newItem : LeagueDetails)
    func saveAllChanges()
    func featchData(completion : @escaping([LeagueDetails]?) -> Void)
    func searchForLeague(id:String,completion : @escaping([LeagueDetails]?) -> Void)
    func getFavouriteList() -> [LeagueDetails]
    func deleteItemAt(index:Int)
    
}
