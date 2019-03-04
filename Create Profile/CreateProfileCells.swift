//
//  CreateProfileCells.swift
//  Denimology
//
//  Created by Kyle Brooks Robinson on 3/4/19.
//  Copyright © 2019 Rocktransformed. All rights reserved.
//

import UIKit

class CreateProfileCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var entryField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var errorHeightConstraint: NSLayoutConstraint!
    
    var parameter: ProfileParameter! { didSet { setUpCell() } }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func setUpCell() {
        
        entryField.placeholder = parameter.type.rawValue
        errorMessage.text = parameter.errorMessage
        
    }
    
    // MARK: - TextField Methods
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let input = textField.text ?? ""
        
        parameter.value = input

        if input.isEmpty && parameter.isRequired {
            showError()
        } else {
            
            
            
        }
        
        
    }
    
    // MARK: - Error Handling
    
    func showError() {
        
        
        
    }

}

class CreateProfileButtonCell: UITableViewCell {
    
    @IBOutlet weak var button: UIButton!
    
    var buttonPressedClosure: (() -> ()) = { }
    
    @IBAction func buttonPressed(_ sender: Any) {
        buttonPressedClosure()
    }
    
}
