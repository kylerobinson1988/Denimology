//
//  DenimNerd.swift
//  Denimology
//
//  Created by Kyle Brooks Robinson on 12/20/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DenimNerd {
    
    var denimItems: [DenimItem] = []
    
    var friends: [DenimNerd] = []
    
    var uniqueUserId: String?
    
    var userName: String?
    var bio: String?
    var bioImage: UIImage?
    
    var facebook: String?
    var twitter: String?
    var instagram: String?
    var reddit: String?
 
    func saveToCoreData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "DenimNerdCore", in: managedContext) else { return }
        
        let denimNerd = NSManagedObject(entity: entity, insertInto: managedContext)
        
        denimNerd.setValue(uniqueUserId, forKey: "uniqueUserId")
        
        do {
            
            try managedContext.save()
            
        } catch let error as NSError {
            
            print("Could not save. \(error), \(error.userInfo)")
            
        }
        
    }
    
    static func createFromCoreData(coreObject: NSManagedObject) -> DenimNerd {
        
        let newDenimNerd = DenimNerd()
        
        guard let denimNerdCoreObject = coreObject as? DenimNerdCore else { return newDenimNerd }
        
        newDenimNerd.uniqueUserId = denimNerdCoreObject.uniqueUserId
        
        return newDenimNerd
        
    }
    
    static func fetchNerds() -> [DenimNerd] {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "DenimNerdCore")
        
        var nerdObjects: [NSManagedObject] = []
        
        do {
            
            nerdObjects = try managedContext.fetch(fetchRequest)
            
        } catch let error as NSError {
            
            print("Could not save. \(error), \(error.userInfo)")
            
        }
        
        let nerdItems = nerdObjects.map {
            
            DenimNerd.createFromCoreData(coreObject: $0)
            
        }
        
        return nerdItems
        
    }
    
}
