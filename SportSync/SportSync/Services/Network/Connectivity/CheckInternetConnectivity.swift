//
//  CheckInternetConnectivity.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 10/05/2024.
//

import Foundation
import Alamofire

class CheckInternetConnectivity{
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

