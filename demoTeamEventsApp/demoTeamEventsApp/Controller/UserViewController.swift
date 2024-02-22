//
//  UserViewController.swift
//  demoTeamEventsApp
//
//  Created by Andrea Hernandez on 2/22/24.
//

import UIKit
import FirebaseAuth

class UserViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            // Navegar a la siguiente vista
            // Pop al root view controller
            self.navigationController?.popToRootViewController(animated: true)
            
        } catch {
            
        }
    }
    
}
