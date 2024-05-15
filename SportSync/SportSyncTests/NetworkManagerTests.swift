//
//  SportSyncTests.swift
//  SportSyncTests
//
//  Created by Abdelrhman Mamdouh on 15/05/2024.
//
import XCTest
import Alamofire
@testable import SportSync
class NetworkManagerTests: XCTestCase {
    
    func testFetchUpComingEvents_Success() {
       
    let leagueDetails = LeagesDetailsViewModel(id:207, sport: "football",leageName: "perimer league",leageLogo: "league")

    let myExpectation = self.expectation(description: "Fetch upcoming events")
        var fetchedEvents: [Event]?
        leagueDetails.fetchUpComingEvents { events in
            fetchedEvents = events
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 5) { error in
            XCTAssertNotNil(fetchedEvents)
        }
    }
    func testFetchUpComingEvents_failure() {
        
        let leagueDetails = LeagesDetailsViewModel(id:27, sport: "j",leageName: "perimer league",leageLogo: "league")
        
        let myExpectation = self.expectation(description: "Fetch upcoming events")
        
        var fetchedEvents: [Event]?
        leagueDetails.fetchUpComingEvents { events in
            fetchedEvents = events
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(fetchedEvents)
        }
    }
    func testFetchLeagues() {
           let viewModel = LeaguesViewModel(sport: "football")
           let expectation = self.expectation(description: "Fetch leagues")
           var fetchedLeagues: [League]?
        var _: Error?
           
           viewModel.fetchLeagues { leagues, error in
               fetchedLeagues = leagues
               expectation.fulfill()
           }
               waitForExpectations(timeout: 5) { error in
               XCTAssertNotNil(fetchedLeagues)
           }
       }
    func testFetchLeagues_failure() {
        let viewModel = LeaguesViewModel(sport: "sad")
        let expectation = self.expectation(description: "Fetch leagues")
        var fetchedLeagues: [League]?
        var _: Error?
        
        viewModel.fetchLeagues { leagues, error in
            fetchedLeagues = leagues
            expectation.fulfill()
        }
            waitForExpectations(timeout: 5) { error in
            XCTAssertNil(fetchedLeagues)
        }
    }
    func testFetchLeagueTeams() {
        
        let leagueDetails = LeagesDetailsViewModel(id:207, sport: "football",leageName: "perimer league",leageLogo: "league")
        
        let expectation = self.expectation(description: "Fetch league teams")
        var fetchedTeams: [Team]?
            
        leagueDetails.fetchLeagueTeams {teams in
            fetchedTeams = teams
            expectation.fulfill()
            }
        
            waitForExpectations(timeout: 5) { error in
                XCTAssertNotNil(fetchedTeams)
            }
        }
    func testFetchLeagueTeams_failure() {
        
        let leagueDetails = LeagesDetailsViewModel(id:207, sport: "564",leageName: "perimer league",leageLogo: "league")
        
        let expectation = self.expectation(description: "Fetch league teams")
        var fetchedTeams: [Team]?
            
        leagueDetails.fetchLeagueTeams {teams in
            fetchedTeams = teams
            expectation.fulfill()
            }
        
            waitForExpectations(timeout: 5) { error in
                XCTAssertNil(fetchedTeams)
            }
        }
}
