//
//  CreateProfileViewModel.swift
//  Denimology
//
//  Created by Kyle Brooks Robinson on 2/28/19.
//  Copyright © 2019 Rocktransformed. All rights reserved.
//

import Foundation

class CreateProfileViewModel {
    
    var entryFields: [ProfileParameter] = []
    
    init() {
        
        entryFields = [
        
            ProfileParameter(type: .name, isRequired: true, errorMessage: "Please enter a username."),
            ProfileParameter(type: .password, isRequired: true, errorMessage: "Please enter a password."),
            ProfileParameter(type: .confirm, isRequired: true, errorMessage: "Password must match."),
            ProfileParameter(type: .about),
            ProfileParameter(type: .insta),
            ProfileParameter(type: .twitter),
            ProfileParameter(type: .reddit)
        
        ]
        
    }
    
}

class ProfileParameter {
    
    enum parameterType: String {
        
        case name = "User Name"
        case password = "Password"
        case confirm = "Confirm Password"
        case about = "About"
        case insta = "Instagram"
        case twitter = "Twitter"
        case reddit = "Reddit"
        
    }
    
    var type: parameterType
    var errorMessage: String?
    var value: String = ""
    var isRequired = false
    
    init(type: parameterType, isRequired: Bool = false, errorMessage: String? = nil) {
        self.type = type
        self.errorMessage = errorMessage
    }
    
}
