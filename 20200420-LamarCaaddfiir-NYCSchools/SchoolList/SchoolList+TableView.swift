//
//  SchoolList+TableView.swift
//  20200420-LamarCaaddfiir-NYCSchools
//
//  Created by Lamar Caaddfiir on 4/20/20.
//  Copyright © 2020 Lamar Caaddfiir. All rights reserved.
//

import UIKit
import Foundation

extension SchoolListVC: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: UITableViewDataSource -
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item =  viewModel.items[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: SchoolListCell.identifier, for: indexPath) as! SchoolListCell
        if let text = item[ViewModel.Constants.schoolNameKey] {
            cell.setup(schoolName: text)
        }
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.selectedRow = indexPath.row
        return indexPath
    }

}
