//
//  UIViewController+Exstension.swift
//  20200420-LamarCaaddfiir-NYCSchools
//
//  Created by Lamar Caaddfiir on 4/21/20.
//  Copyright © 2020 Lamar Caaddfiir. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    
    //MARK: Computerd Properties -
    static var identifier: String {
        return String(describing: self)
    }
}
