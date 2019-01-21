//
//  DenimItem.swift
//  Denimology
//
//  Created by Kyle Brooks Robinson on 12/18/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation
import UIKit
import CoreData

enum DenimItemType: String {
    
    case jeans, jacket, shirt, other
    
    var name: String {
        
        switch self {
            
        case .jeans: return "Jeans"
        case .jacket: return "Jacket"
        case .shirt: return "Shirt"
        case .other: return "Other"
            
        }
        
    }
    
}

class DenimItem {
    
    // Information
    var brand: String?
    var name: String?
    var type: DenimItemType?
    var size: Int?
    var sanforized: Bool?
    var weight: Double?
    var dateStarted: String?
    
    var hoursWorn: Int?
    
    var daysWorn: Int? {
        
        didSet {
            hoursWorn = (daysWorn ?? 0) * 14
        }
        
    }
    
    var washes: Int?
    
    var measurements: ClothingMeasurement?
    
    var journal: [EntryLog] = []
 
    func saveToCoreData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "DenimItemCore", in: managedContext) else { return }
        
        let denimItem = NSManagedObject(entity: entity, insertInto: managedContext)
        
        denimItem.setValue(brand, forKey: "brand")
        denimItem.setValue(name, forKey: "name")
        denimItem.setValue(type, forKey: "type")
        denimItem.setValue(size, forKey: "size")
        denimItem.setValue(sanforized, forKey: "sanforized")
        denimItem.setValue(weight, forKey: "weight")
        denimItem.setValue(dateStarted, forKey: "dateStarted")
        denimItem.setValue(hoursWorn, forKey: "hoursWorn")
        denimItem.setValue(daysWorn, forKey: "daysWorn")
        denimItem.setValue(washes, forKey: "washes")
        // Measurements
        // Journal
        
        do {
            
            try managedContext.save()
            
        } catch let error as NSError {
            
            print("Could not save. \(error), \(error.userInfo)")
            
        }
        
    }
    
    static func createFromCoreData(coreObject: NSManagedObject) -> DenimItem {
        
        let newDenimItem = DenimItem()
        
        guard let denimItemCoreObject = coreObject as? DenimItemCore else { return newDenimItem }
        
        newDenimItem.brand = denimItemCoreObject.brand
        newDenimItem.name = denimItemCoreObject.name
        newDenimItem.type = DenimItemType(rawValue: denimItemCoreObject.type ?? "")
        newDenimItem.size = Int(denimItemCoreObject.size)
        newDenimItem.sanforized = denimItemCoreObject.sanforized
        newDenimItem.weight = denimItemCoreObject.weight
        newDenimItem.dateStarted = denimItemCoreObject.dateStarted
        newDenimItem.daysWorn = Int(denimItemCoreObject.daysWorn)
        newDenimItem.washes = Int(denimItemCoreObject.washes)
        
        // Journal
        // Measurements
        
        return newDenimItem
        
    }
    
    static func fetchDenimItems() -> [DenimItem] {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "DenimItemCore")
        
        var denimCoreObjects: [NSManagedObject] = []
        
        do {
            
            denimCoreObjects = try managedContext.fetch(fetchRequest)
            
        } catch let error as NSError {
            
            print("Could not save. \(error), \(error.userInfo)")
            
        }
        
        let denimItems = denimCoreObjects.map {
            
            DenimItem.createFromCoreData(coreObject: $0)
            
        }
        
        return denimItems
        
    }
    
}




