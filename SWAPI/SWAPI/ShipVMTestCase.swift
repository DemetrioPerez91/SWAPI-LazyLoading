//
//  ShipVMTestCase.swift
//  SWAPI
//
//  Created by User on 8/8/17.
//  Copyright © 2017 Demetrio. All rights reserved.
//

import XCTest
@testable import SWAPI

class ShipVMTestCase: XCTestCase {
    var vm:ShipVM?
    
    
    
    override func setUp() {
        super.setUp()
        let ship = Ship(name: "Death Star", model: "Bog ball", manufacturer: "SomeDude", starshipClass: "Big Ass Battle Station (B.A.B.S)")
        vm = ShipVM(ship: ship)
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShipName()
    {
        XCTAssertEqual(vm?.name, "Name: Death Star")
    }
    
    func testShipClass()
    {
        XCTAssertEqual(vm?.starshipClass, "Class: Big Ass Battle Station (B.A.B.S)")
    }
    

    
}
