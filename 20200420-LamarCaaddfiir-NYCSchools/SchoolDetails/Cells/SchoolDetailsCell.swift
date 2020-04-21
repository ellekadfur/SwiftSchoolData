//
//  SchoolDetailsCell.swift
//  20200420-LamarCaaddfiir-NYCSchools
//
//  Created by Lamar Caaddfiir on 4/21/20.
//  Copyright © 2020 Lamar Caaddfiir. All rights reserved.
//

import UIKit
import Foundation


class SchoolDetailsCell: UITableViewCell {

    //MARK: Properties -
    @IBOutlet weak var rowLabel: UILabel!
    
    //MARK: LifeCycle -
    override func prepareForReuse() {
        super.prepareForReuse()
        rowLabel.text = nil
    }
    
    //MARK: Setup -
    func setup(text: String) {
        rowLabel.text = text
    }
    
}

