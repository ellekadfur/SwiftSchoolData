//
//  SchoolService.swift
//  20200420-LamarCaaddfiir-NYCSchools
//
//  Created by Lamar Caaddfiir on 4/20/20.
//  Copyright © 2020 Lamar Caaddfiir. All rights reserved.
//

import UIKit
import Foundation
import Alamofire


protocol ServiceProtocol {//ljc - use for dependency Injection.
    func fetchSchools(completion: @escaping (Any?, Bool) -> ())
}

//ljc - can make Service it's own class no issue.
//ljc - if i had more time i would use core data to store the items as there are so many, consuming memory. 
extension SchoolListVC.ViewModel {
    class Service: ServiceProtocol {

        func fetchSchools(completion: @escaping (Any?, Bool) -> ()) {
            guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else { completion(nil, false); return }
            var request = URLRequest(url: url)
            request.httpMethod = HTTPMethod.get.rawValue
            Alamofire.request(request).validate(statusCode: 200..<300).validate(contentType: ["application/json"]).responseData(queue: DispatchQueue.global(qos: .background)) { response in
                switch response.result {
                case .success(let value):
                    completion(value, true)
                case .failure(let error):
                    completion(error, false)
                }
            }
        }
        
    }
}

