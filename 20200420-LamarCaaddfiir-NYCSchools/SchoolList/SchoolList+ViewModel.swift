//
//  SchoolList+ViewModel.swift
//  20200420-LamarCaaddfiir-NYCSchools
//
//  Created by Lamar Caaddfiir on 4/20/20.
//  Copyright © 2020 Lamar Caaddfiir. All rights reserved.
//
import UIKit
import Foundation

extension SchoolListVC {
    class ViewModel {
        
        struct Constants { //ljc - because this app isn't using any of the data point in the model, I didn't use Codable, CodingKeys, KeyedDecodingContainer. For the Unit Testing, simply testing that the view model returned the data is sufficient, in a professional app, we want to test each use case. Unfortuntately, I do not have time for this here, so I have just created KEY below to crap value from DATA MODEL
            static let schoolNameKey: String = "school_name"
        }
        
        //MARK: Data Model -
        typealias Item = [String: String]?

        //MARK: Properties -
        private let service: ServiceProtocol!
        var items: [Item] = []//ljc - would make this private and add accessing method if given more time and was professional app
        
        //MARK: LifeCycle -
        init(apiService: ServiceProtocol) {
            service = apiService
        }
        
        //MARK: Fetch -
        func fetch(completion: @escaping (()-> Void)) {
            service.fetchSchools { [unowned self] (value, isSuccessful) in//ljc - i would create ResultStatus Type in professional app, instead of isSuccessful Boolean
                if isSuccessful {
                    if let data = value as? Data, let jsonString = String(data: data, encoding: .utf8), let items = jsonString.convertToDictionary() as? [Item] {
                        self.items = items
                    } else {
                        //ljc - in professional app, we would want to pass success/fail to VC in completion, to update UI this app is demonstration of use of data mostly so not needed.
                        print("Error: \(value.debugDescription)")
                    }
                    completion()
                } else {
                    print("Error: \(value.debugDescription)")
                    completion()
                }
            }
        }
        
    }
}

