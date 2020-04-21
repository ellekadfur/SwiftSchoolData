//
//  SchoolList+Fetch.swift
//  20200420-LamarCaaddfiir-NYCSchools
//
//  Created by Lamar Caaddfiir on 4/21/20.
//  Copyright © 2020 Lamar Caaddfiir. All rights reserved.
//

import Foundation

extension SchoolListVC {
    
    //MARK: Networking -
    func fetch() {
        viewModel.fetch { [unowned self] in
            DispatchQueue.main.async { [unowned self] in
                self.tableView.reloadData()
            }
        }        
    }

}
