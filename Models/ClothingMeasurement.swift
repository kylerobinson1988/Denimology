//
//  ClothingMeasurement.swift
//  Denimology
//
//  Created by Kyle Brooks Robinson on 12/20/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ClothingMeasurement {
    
    // Tops
    
    var shoulders: Double?
    var chest: Double?
    var sleeveLength: Double?
    var topLength: Double?
    
    // Bottoms
    
    var waist: Double?
    var frontRise: Double?
    var backRise: Double?
    var topThigh: Double?
    var knee: Double?
    var hem: Double?
    var inseam: Double?
    
    func saveToCoreData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "ClothingMeasurementCore", in: managedContext) else { return }
        
        let measurement = NSManagedObject(entity: entity, insertInto: managedContext)
        
        measurement.setValue(shoulders, forKey: "shoulders")
        measurement.setValue(chest, forKey: "chest")
        measurement.setValue(sleeveLength, forKey: "sleeveLength")
        measurement.setValue(topLength, forKey: "topLength")
        measurement.setValue(waist, forKey: "waist")
        measurement.setValue(frontRise, forKey: "frontRise")
        measurement.setValue(backRise, forKey: "backRise")
        measurement.setValue(topThigh, forKey: "topThigh")
        measurement.setValue(knee, forKey: "knee")
        measurement.setValue(inseam, forKey: "inseam")
        measurement.setValue(hem, forKey: "hem")

        do {
            
            try managedContext.save()
            
        } catch let error as NSError {
            
            print("Could not save. \(error), \(error.userInfo)")
            
        }
        
    }
    
    static func createFromCoreData(coreObject: NSManagedObject) -> ClothingMeasurement {
        
        let newMeasurement = ClothingMeasurement()
        
        guard let measurementCoreObject = coreObject as? ClothingMeasurementCore else { return newMeasurement }
        
        newMeasurement.sleeveLength = measurementCoreObject.sleeveLength
        newMeasurement.chest = measurementCoreObject.chest
        newMeasurement.shoulders = measurementCoreObject.shoulders
        newMeasurement.topLength = measurementCoreObject.topLength
        newMeasurement.waist = measurementCoreObject.waist
        newMeasurement.frontRise = measurementCoreObject.frontRise
        newMeasurement.backRise = measurementCoreObject.backRise
        newMeasurement.topThigh = measurementCoreObject.topThigh
        newMeasurement.knee = measurementCoreObject.knee
        newMeasurement.hem = measurementCoreObject.hem
        newMeasurement.inseam = measurementCoreObject.inseam
        
        return newMeasurement
        
    }
    
    static func fetchMeasurements() -> [ClothingMeasurement] {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ClothingMeasurementCore")
        
        var measurementObjects: [NSManagedObject] = []
        
        do {
            
            measurementObjects = try managedContext.fetch(fetchRequest)
            
        } catch let error as NSError {
            
            print("Could not save. \(error), \(error.userInfo)")
            
        }
        
        let measurementItems = measurementObjects.map {
            
            ClothingMeasurement.createFromCoreData(coreObject: $0)
            
        }
        
        return measurementItems
        
    }
    
}
