//
//  SchoolDetailsVC.swift
//  20200420-LamarCaaddfiir-NYCSchools
//
//  Created by Lamar Caaddfiir on 4/20/20.
//  Copyright © 2020 Lamar Caaddfiir. All rights reserved.
//

import UIKit

class SchoolDetailsVC: UIViewController {
    
    //MARK: Properties -
    @IBOutlet weak var tableView: UITableView!
    var rows: [String]? = nil
    
    //MARK: LifeCycle - 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
}
