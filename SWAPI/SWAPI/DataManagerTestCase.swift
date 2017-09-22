//
//  DataManagerTestCase.swift
//  SWAPI
//
//  Created by User on 8/8/17.
//  Copyright © 2017 Demetrio. All rights reserved.
//

import XCTest
@testable import SWAPI

class DataManagerTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetNextURL()
    {
        let testURL = "https://swapi.co/api/starships/?page=1&format=json"
        let result = "https://swapi.co/api/starships/?page=2&format=json"
        let expectString = expectation(description: "Test URL")
        WebServiceManager.instance.getInfo(url: testURL, completion:
        {
            dic in
            JSONParser.instance.dictionary = dic
            JSONParser.instance.setNextPage()
      
            expectString.fulfill()
        })
        waitForExpectations(timeout: 20, handler: {
            _ in
            XCTAssertEqual(result, DataManager.instance.nextPage)
        })
    }
    
    
    
}
