//
//  EntryLog.swift
//  Denimology
//
//  Created by Kyle Brooks Robinson on 12/20/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation
import UIKit

enum WearLevel {
    
    case light, regular, heavy, extreme
    
    var name: String {
        
        switch self {
            
        case .light: return "Light"
        case .regular: return "Regular"
        case .heavy: return "Heavy"
        case .extreme: return "Extreme"
            
        }
        
    }
    
}

class EntryLog {
    
    var associatedDenim: DenimItem?
    var image: UIImage?
    var entry: String?
    var wearLevel: WearLevel?
    
}
