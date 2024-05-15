//
//  TeamViewModel.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 11/05/2024.
//

import Foundation

class TeamViewModel {
    var id: Int?
    var sport: String?
    var leagueName: String?
    var teamsData: [Team]?
    var teamDetails: Team
    
    init(id: Int, sport: String,leagueName :String) {
        self.id = id
        self.sport = sport
        self.leagueName = leagueName
        teamsData = [Team]()
        teamDetails = Team()
    }
    
    func fetchTeam(completionHandler: @escaping ([Team]?, Error?) -> Void) {
    
        let requestParameters: [String: Any] = ["met": "Teams", "teamId": id ?? 4998]
        NetworkManager.shared.requestData(endpoint: sport ?? "", parameters: requestParameters) { (result: Result<TeamResponse, Error>) in
            switch result {
            case .success(let response):
                self.teamsData = response.result
                completionHandler(response.result, nil)
            case .failure(let error):
                print("Error fetching teams: \(error)")
                completionHandler(nil, error)
            }
        }
    }
}
