//
//  SchoolListTests.swift
//  20200420-LamarCaaddfiir-NYCSchoolsTests
//
//  Created by Lamar Caaddfiir on 4/21/20.
//  Copyright © 2020 Lamar Caaddfiir. All rights reserved.
//

import XCTest
@testable import LamarCaaddfiir_NYCSchools


//TODO: Fix unit Test \o/
class SchoolListTests: XCTestCase {
    
    var viewModel: SchoolListVC.ViewModel!
    var mockAPIService: MockApiService!

    override func setUp() {
        super.setUp()
        mockAPIService = MockApiService()
        viewModel = SchoolListVC.ViewModel(apiService: SchoolListVC.ViewModel.Service())
    }
    
    override func tearDown() {
        viewModel = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    func test_fetch() {
        mockAPIService.dataModel = [:]

        viewModel.fetch { }
        mockAPIService.fetchSuccess()

        XCTAssert(mockAPIService!.isFetchCalled)
    }
    
    func test_fail() {
        mockAPIService.dataModel = [:]
        viewModel.fetch { }
        mockAPIService.fetchFail()
        XCTAssert(!mockAPIService!.isFetchCalled)

    }
    

}


class MockApiService: ServiceProtocol {
    
    var isFetchCalled = false
    
    var dataModel: [String: String]?
    var completeClosure: ((Any?, Bool) -> ())!
    
    func fetchSchools(completion: @escaping (Any?, Bool) -> ()) {
        isFetchCalled = true
        completeClosure = completion
        
    }
    
    func fetchSuccess() {
        completeClosure(dataModel, true)
    }
    
    func fetchFail() {
        completeClosure(dataModel, false)
    }
    
}

class StubGenerator {
    func stubData() -> [[String: String]] {
        let path = Bundle.main.path(forResource: "test", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let dict = try! decoder.decode([[String: String]].self, from: data)
        return dict
    }
}
