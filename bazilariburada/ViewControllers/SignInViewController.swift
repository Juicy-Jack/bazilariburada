//
//  SignInViewController.swift
//  bazilariburada
//
//  Created by Furkan Doğan on 15.11.2024.
//

import UIKit

class SignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushTestView(_ sender: UIButton) {
        navigationController?.pushViewController(TestViewController(), animated: true)
    }
}
