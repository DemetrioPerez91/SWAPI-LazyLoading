//
//  JSONParserTestCase.swift
//  SWAPI
//
//  Created by User on 8/8/17.
//  Copyright © 2017 Demetrio. All rights reserved.
//

import XCTest
@testable import SWAPI

class JSONParserTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testparseNextPage()
    {
        let expectNEXT = expectation(description: "Waiting or URL for next page")
        WebServiceManager.instance.getInfo(url:WebServiceManager.instance.testURL, completion:
        {
            dic in
            JSONParser.instance.dictionary = dic
            JSONParser.instance.setNextPage()
            expectNEXT.fulfill()
            
        })
        waitForExpectations(timeout: 20, handler:
        {
            _ in
            XCTAssertEqual("https://swapi.co/api/starships/?format=json&page=2", DataManager.instance.nextPage)
        })
    }
    
    
    
    func testGetResults()
    {
        let expect = expectation(description: "Waiting for data")
        var results:[AnyObject] = []
        WebServiceManager.instance.getInfo(url:WebServiceManager.instance.testURL, completion:
            {
                dic in
                JSONParser.instance.dictionary = dic
                results = JSONParser.instance.getResults()
                expect.fulfill()
        })
        waitForExpectations(timeout: 20, handler:
        {
            _ in
            XCTAssertEqual(results.count, 10)
        })
        
    }
    
    func testParseShip()
    {
        let expect = expectation(description: "Waiting for data")
        
        var ship:ShipVM?
        WebServiceManager.instance.getInfo(url:WebServiceManager.instance.testURL, completion:
            {
                dic in
                JSONParser.instance.dictionary = dic
                let results = JSONParser.instance.getResults()
                ship = JSONParser.instance.parseShip(data: results[0] as! [String:AnyObject])
                
                expect.fulfill()
        })
        waitForExpectations(timeout: 20, handler:
            {
                _ in
                
                XCTAssertNotNil(ship)
                XCTAssertEqual("Name: Executor", ship?.name)
        })
    }
    
    func testParseFullArray()
    {
        let expect = expectation(description: "Waiting for data")
        
        var ships:[ShipVM]?
        WebServiceManager.instance.getInfo(url:WebServiceManager.instance.testURL, completion:
            {
                dic in
                JSONParser.instance.dictionary = dic
                ships = JSONParser.instance.parseShips()
                expect.fulfill()
        })
        waitForExpectations(timeout: 20, handler:
            {
                _ in
                
                XCTAssertNotNil(ships?[0])
                XCTAssertNotNil(ships?[1])
                XCTAssertEqual("Name: Executor", ships?[0].name)
                
                XCTAssertEqual("Name: Sentinel-class landing craft", ships?[1].name)
        })
    }
    
    func testRunParser()
    {
        let expect = expectation(description: "Waiting for data")
        WebServiceManager.instance.getInfo(url:WebServiceManager.instance.testURL, completion:
        {
            dic in
            JSONParser.instance.runParser(dic: dic!)
            expect.fulfill()
        })
        waitForExpectations(timeout: 20, handler:
        {
            _ in
            XCTAssertEqual(DataManager.instance.ships.count, 10)
        })
    }
}
