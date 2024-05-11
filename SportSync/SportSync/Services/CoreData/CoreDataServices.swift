//
//  CoreDataServices.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 11/05/2024.
//

import Foundation
import UIKit
import CoreData
class CoreDataServices
{
    var  manageContext :NSManagedObjectContext?
    init() {
        let appDelegte = UIApplication.shared.delegate as! AppDelegate
        manageContext = appDelegte.persistentContainer.viewContext
    }
    func insertfavouriteLeague(league:League)
    {
    }
}
