//
//  String+Extensions.swift
//  20200420-LamarCaaddfiir-NYCSchools
//
//  Created by Lamar Caaddfiir on 4/21/20.
//  Copyright © 2020 Lamar Caaddfiir. All rights reserved.
//

import Foundation

extension String {
    
    //MARK: Methods - 
    func convertToDictionary() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}

