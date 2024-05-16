//
//  LeagueDetailViewModelProtcol.swift
//  SportSync
//
//  Created by Hussien on 16/05/2024.
//

import Foundation
protocol LeagueDetailsViewModelProtcol{
    func addItem(newItem : LeagueDetails)
    func searchForAnItem() -> Bool
    func deleteItemWithId()
    func fetchUpComingEvents(completionHandler: @escaping ([Event]?) -> Void)
    func fetchLatestEvents(completionHandler: @escaping ([Event]?) -> Void)
    func fetchLeagueTeams(completionHandler: @escaping ([Team]?) -> Void)
    func getLeagesEvents() -> [Event]
    func getLatestEvents() -> [Event]
    func getLeagueTeams() -> [Team]
    func getLeagueid()->Int
    func getLeagueName()->String
    func getLeaguelogo()->String
    func getSport()->String
    
}
