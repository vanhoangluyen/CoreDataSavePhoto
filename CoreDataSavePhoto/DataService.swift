//
//  DataService.swift
//  CoreDataSavePhoto
//
//  Created by Hoang Luyen on 3/31/18.
//  Copyright © 2018 HoangLuyen. All rights reserved.
//

import Foundation
import CoreData

class DataService {
    
    static let shared : DataService = DataService()
    private var _arrayData:[Entity]?
    var arrayData: [Entity] {
        get {
            if _arrayData == nil {
                getDataFromCoreData()
            }
            return _arrayData ?? []
        }
        set {
            _arrayData = newValue
        }
    }
    func getDataFromCoreData() {
        _arrayData = []
        do {
           _arrayData = try AppDelegate.context.fetch(Entity.fetchRequest())
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    func removeData() {
        _arrayData = nil
    }
}
