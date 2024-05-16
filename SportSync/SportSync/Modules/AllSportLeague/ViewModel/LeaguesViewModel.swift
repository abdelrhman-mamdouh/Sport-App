//
//  LeaguesViewModel.swift
//  SportSync
//
//  Created by Hussien on 11/05/2024.
//

import Foundation
class LeaguesViewModel :LeaguesViewModelProtocol{
    private var leaguesResult: [League]?
    private var sport: String
    
    init(sport: String) {
        self.sport = sport
        leaguesResult = [League]()
    }

    func fetchLeagues(completionHandler: @escaping ([League]?, Error?) -> Void) {
        let requestParameters: [String: Any] = ["met": "Leagues"]
        NetworkManager.shared.requestData(endpoint: sport, parameters: requestParameters) { (result: Result<LeagueResponse, Error>) in
            switch result {
            case .success(let response):
                self.leaguesResult = response.result
                completionHandler(response.result, nil)
            case .failure(let error):
                
                completionHandler(nil, error)
            }
        }
    }
    func getResult() -> [League]{
        return self.leaguesResult ?? []
    }
    
    func getSport() -> String{
        return self.sport
    }
}
