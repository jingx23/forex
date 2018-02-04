//
//  ForexTests.swift
//  ForexTests
//
//  Created by Jan Scheithauer on 30.12.17.
//  Copyright © 2017 Jan Scheithauer. All rights reserved.
//

import XCTest
@testable import Forex

class ForexTests: XCTestCase {
    let f = Forex.shared
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNumberOfRetrievedCurrencies() {
        let ex = expectation(description: "")
        f.rate(value: 1.0, from: .EUR, to: [.USD, .CAD]) { (exchanges, _) in
            XCTAssertTrue(exchanges?.count == 2)
            ex.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: { (error) in
            if error != nil {
                XCTFail(error!.localizedDescription)
            }
        })
    }
    
    func testExchangesForSpecificDate() {
        let ex = expectation(description: "")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let exchangeDate = dateFormatter.date(from: "2000-01-03")
        
        f.rate(value: 1.0, date: exchangeDate!, from: .EUR, to: .USD) { (exchange, _) in
            XCTAssertEqual(1.009, exchange!.value)
            ex.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: { (error) in
            if error != nil {
                XCTFail(error!.localizedDescription)
            }
        })
    }
    
}
