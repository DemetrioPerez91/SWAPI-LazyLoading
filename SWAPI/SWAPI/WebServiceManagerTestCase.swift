//
//  WebServiceManagerTestCase.swift
//  SWAPI
//
//  Created by User on 8/8/17.
//  Copyright © 2017 Demetrio. All rights reserved.
//

import XCTest
@testable import SWAPI
class WebServiceManagerTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testGetInfo()
    {
        var json:[String:AnyObject]?
        let expectJSON =  expectation(description: "Wait For JSON")
        WebServiceManager.instance.getInfo(url: WebServiceManager.instance.testURL,completion:{
            dic in
            json = dic
            XCTAssertNotNil(dic)
            expectJSON.fulfill()
        })
        waitForExpectations(timeout: 20, handler: {
            _ in
            
            XCTAssertNotNil(json)
            
        })
    }
    
}
