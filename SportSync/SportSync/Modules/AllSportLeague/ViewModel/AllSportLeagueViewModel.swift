//
//  AllSportLeagueViewModel.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 11/05/2024.
//

import Foundation
class LeaguesViewModel {
    private var leaguesResult: [League]?
    var sport: String?
    
    init(sport: String) {
        self.sport = sport
        leaguesResult = [League]()
    }

    func fetchLeagues(completionHandler: @escaping ([League]?, Error?) -> Void) {
        let requestParameters: [String: Any] = ["met": "Leagues"]
        NetworkManager.shared.requestData(endpoint: sport ?? "", parameters: requestParameters) { (result: Result<LeagueResponse, Error>) in
            switch result {
            case .success(let response):
                self.leaguesResult = response.result
                completionHandler(response.result, nil)
            case .failure(let error):
                print("Error fetching leagues: \(error)")
                completionHandler(nil, error)
            }
        }
    }
    func getResult() -> [League]{
        return self.leaguesResult ?? []
    }
}

