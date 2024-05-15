//
//  TestMocking.swift
//  SportSyncTests
//
//  Created by Abdelrhman Mamdouh on 15/05/2024.
//
import XCTest

@testable import SportSync
   
final class TestMocking: XCTestCase {
    
    var mockObjSuccess: MockNetworkService!
    var mockObjError: MockNetworkService!
    override func setUpWithError() throws {
        mockObjSuccess = MockNetworkService(shouldReturnError: false)
        mockObjError = MockNetworkService(shouldReturnError: true)
    }
    
    override func tearDownWithError() throws {
        
    }
    func testFetchLeaguesFromJSON_Success() {
        mockObjSuccess.fetchFromJSON(jsonData: mockObjSuccess.fakeLeaguesJsonObj) { (response: LeagueResponse?, error) in
            if let error = error {
                XCTFail()
            } else {
                XCTAssertNotNil(response)
            }
        }
       
    }
    
    func testFetchLeaguesFromJSON_Error() {
        mockObjError.fetchFromJSON(jsonData: mockObjError.fakeLeaguesJsonObj) { (response: LeagueResponse?, error) in
            if let error = error {
                XCTAssertNotNil(error)
            } else {
                XCTFail()
            }
            
        }
    }
    
    func testFetchLeaguesEventsFromJSON_Success() {
        
        mockObjSuccess.fetchFromJSON(jsonData: mockObjSuccess.fakeLeaguesJsonObj) { (response: EventResponse?, error) in
            if let error = error {
                XCTFail()
            } else {
                XCTAssertNotNil(response)
            }
        }
    }
    
    func testFetchLeaguesEventsFromJSON_Error() {
        mockObjError.fetchFromJSON(jsonData: mockObjError.fakeLeaguesJsonObj) { (response: EventResponse?, error) in
            if let error = error {
                XCTAssertNotNil(error)
            } else {
                XCTFail()
            }
            
        }
    }
    func testFetchTeamsFromJSON_Success(){
        
        mockObjSuccess.fetchFromJSON(jsonData: mockObjSuccess.fakeLeaguesJsonObj) { (response: TeamResponse?, error) in
            if let error = error {
                XCTFail()
            } else {
                XCTAssertNotNil(response)
            }
        }
    }
    func testFetchTeamsFromJSON_Error() {
        mockObjError.fetchFromJSON(jsonData: mockObjError.fakeLeaguesJsonObj) { (response: TeamResponse?, error) in
            if let error = error {
                XCTAssertNotNil(error)
            } else {
                XCTFail()
            }
            
        }
    }
}
