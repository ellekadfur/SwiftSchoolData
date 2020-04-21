//
//  SchoolListCell.swift
//  20200420-LamarCaaddfiir-NYCSchools
//
//  Created by Lamar Caaddfiir on 4/21/20.
//  Copyright © 2020 Lamar Caaddfiir. All rights reserved.
//

import UIKit

class SchoolListCell: UITableViewCell {

    //MARK: Properties -
    @IBOutlet weak var schoolNameLabel: UILabel!
    
    //MARK: LifeCycle -
    override func prepareForReuse() {
        super.prepareForReuse()
        schoolNameLabel.text = nil
    }
    
    //MARK: Setup -
    func setup(schoolName: String) {
        schoolNameLabel.text = schoolName
    }
    
}
