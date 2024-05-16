//
//  LeaguesViewModelProtocol.swift
//  SportSync
//
//  Created by Hussien on 16/05/2024.
//

import Foundation
protocol LeaguesViewModelProtocol{
    func fetchLeagues(completionHandler: @escaping ([League]?, Error?) -> Void)
    func getResult() -> [League]
    func getSport() -> String
}
