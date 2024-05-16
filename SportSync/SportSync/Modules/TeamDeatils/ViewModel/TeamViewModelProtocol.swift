//
//  TeamViewModelProtocol.swift
//  SportSync
//
//  Created by Hussien on 16/05/2024.
//

import Foundation
protocol TeamViewModelProtocol{
    func fetchTeam(completionHandler: @escaping ([Team]?, Error?) -> Void) 
    func getId() -> Int
    func getSport() -> String
    func getLeagueName() -> String
    func getTeamsData() -> [Team]
    func getTeamDetails() -> Team
    func setTeamData (teamData : [Team])
    func setTeamDetails (teamDetails : Team)
    

}
