//
//  MainScreenViewModelExtension.swift
//  bazilariburada
//
//  Created by Furkan Doğan on 23.11.2024.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell() // Temporary code
    }
    
    
}
