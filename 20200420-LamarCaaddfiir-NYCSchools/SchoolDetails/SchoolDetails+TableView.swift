//
//  SchoolDetails+TableView.swift
//  20200420-LamarCaaddfiir-NYCSchools
//
//  Created by Lamar Caaddfiir on 4/21/20.
//  Copyright © 2020 Lamar Caaddfiir. All rights reserved.
//

import UIKit
import Foundation

extension SchoolDetailsVC: UITableViewDataSource {
    
    //MARK: UITableViewDataSource -
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let rows = rows else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: SchoolDetailsCell.identifier, for: indexPath) as! SchoolDetailsCell
            cell.setup(text: rows[indexPath.row])
        return cell
    }
    
}
