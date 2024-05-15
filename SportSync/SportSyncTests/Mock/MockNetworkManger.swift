//
//  MockNetworkManger.swift
//  SportSyncTests
//
//  Created by Abdelrhman Mamdouh on 15/05/2024.
//

import Foundation
@testable import SportSync

class MockNetworkService {
    enum Enum: Error {
        case myError
    }
    var shouldReturnError: Bool
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    let fakeLeaguesJsonObj: [String: Any] = [
        "success": 1,
        "result": [
            [
                "league_key": 1,
                "league_name": "Premier League",
                "country_key": 1,
                "country_name": "England",
                "league_logo": "premier_league_logo.png",
                "country_logo": "england_flag.png"
            ],
            [
                "league_key": 2,
                "league_name": "La Liga",
                "country_key": 2,
                "country_name": "Spain",
                "league_logo": "la_liga_logo.png",
                "country_logo": "spain_flag.png"
            ],
            [
                "league_key": 3,
                "league_name": "Bundesliga",
                "country_key": 3,
                "country_name": "Germany",
                "league_logo": "bundesliga_logo.png",
                "country_logo": "germany_flag.png"
            ]
        ]
    ]
    let fakeEventJsonObj: [String: Any] = [
            "success": 1,
            "result": [
                [
                    "event_home_team": "Team A",
                    "event_away_team": "Team B",
                    "home_team_key": 1,
                    "away_team_key": 2,
                    "event_home_team_logo": "team_a_logo.png",
                    "event_away_team_logo": "team_b_logo.png",
                    "event_status": "In Progress",
                    "home_team_logo": "team_a_logo.png",
                    "away_team_logo": "team_b_logo.png",
                    "event_date": "2024-05-15",
                    "event_time": "15:00",
                    "league_logo": "league_logo.png",
                    "event_final_result": "3-2",
                    "event_first_player": "Player 1",
                    "event_second_player": "Player 2",
                    "first_player_key": 101,
                    "second_player_key": 102,
                    "event_first_player_logo": "player1_logo.png",
                    "event_second_player_logo": "player2_logo.png"
                ]
            ]
        ]
    let fakeTeamJsonObj: [String: Any] = [
            "success": 1,
            "result": [
                [
                    "team_name": "Team A",
                    "team_logo": "team_a_logo.png",
                    "players": [
                        [
                            "player_name": "Player 1",
                            "player_number": "10",
                            "player_age": "28",
                            "player_type": "Forward",
                            "player_yellow_cards": "2",
                            "player_red_cards": "0",
                            "player_image": "player1_image.png"
                        ],
                        [
                            "player_name": "Player 2",
                            "player_number": "5",
                            "player_age": "25",
                            "player_type": "Defender",
                            "player_yellow_cards": "1",
                            "player_red_cards": "0",
                            "player_image": "player2_image.png"
                        ]
                    ],
                    "coaches": [
                        [
                            "coach_name": "Coach 1"
                        ]
                    ]
                ]
            ]
    ]
}

extension MockNetworkService {
    func fetchFromJSON<T: Decodable>(jsonData: [String: Any], completionHandler: @escaping (T?, Error?) -> Void) {
            var result: T?
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: jsonData, options: [])
                result = try JSONDecoder().decode(T.self, from: jsonData)
            } catch {
                print(error.localizedDescription)
            }
            
            if shouldReturnError {
                completionHandler(nil, Enum.myError)
            } else {
                completionHandler(result, nil)
            }
        }
    }
    
