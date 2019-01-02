//
//  DenimItem.swift
//  Denimology
//
//  Created by Kyle Brooks Robinson on 12/18/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation
import UIKit

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
            hoursWorn = (daysWorn ?? 0) % 14
        }
        
    }
    
    var washes: Int?
    
    var measurements: ClothingMeasurement?
    
    var journal: [EntryLog] = []
    
}




