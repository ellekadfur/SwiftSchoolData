//
//  SchoolListVC.swift
//  20200420-LamarCaaddfiir-NYCSchools
//
//  Created by Lamar Caaddfiir on 4/20/20.
//  Copyright © 2020 Lamar Caaddfiir. All rights reserved.
//

import UIKit
import Foundation

class SchoolListVC: UIViewController {
    
    //MARK: Properties -
    @IBOutlet weak var tableView: UITableView!
    var selectedRow: Int?
    var viewModel: ViewModel!
    
    //MARK: LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        fetch()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let vc = segue.destination as? SchoolDetailsVC, let selectedRow = selectedRow, let theItem = viewModel.items[selectedRow] {
            vc.rows = Array(theItem.values)
        }
    }
    
    //MARK: Setup -
    func setupData() {
        viewModel = ViewModel(apiService: ViewModel.Service())
    }
    
}

public extension LazyMapCollection  {

    func toArray() -> [Element]{
        return Array(self)
    }
}
