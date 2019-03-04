//
//  CreateProfileViewController.swift
//  Denimology
//
//  Created by Kyle Brooks Robinson on 2/28/19.
//  Copyright © 2019 Rocktransformed. All rights reserved.
//

import UIKit

class CreateProfileViewController: UIViewController {

    var viewModel: CreateProfileViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = CreateProfileViewModel()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Closure Actions
    
    func buttonPressed() {
        
        
        
    }

}

extension CreateProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 5 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "createProfileCell") as? CreateProfileCell else { return UITableViewCell() }
            
            cell.parameter = viewModel.entryFields[indexPath.row]
            
            return cell
            
        default:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "createProfileButtonCell") as? CreateProfileButtonCell else { return UITableViewCell() }
            
            cell.buttonPressedClosure = { [weak self] in self?.buttonPressed() }
            
            return cell
            
        }
        
    }
    
}
