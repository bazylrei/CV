//
//  WorkEntryTests.swift
//  CVTests
//
//  Created by Bazyl Reinstein on 4/3/20.
//  Copyright © 2020 Bazyl Reinstein. All rights reserved.
//

import XCTest
@testable import CV

class WorkEntryTests: XCTestCase {
    func testExampleWorkEntry() {
        let workEntry = WorkEntry.exampleWorkEntry
        XCTAssertEqual(workEntry.companyName, "HSBC")
        XCTAssertEqual(workEntry.imageURLString!, "https://i1.wp.com/www.thevideoanimationcompany.com/wp-content/uploads/2017/08/HSBC-logo.png")
        XCTAssertEqual(workEntry.position, "developer")
        XCTAssertEqual(workEntry.responsibilities!.count, 3)
        XCTAssertEqual(workEntry.responsibilities![0], "writing code")
        XCTAssertEqual(workEntry.shortDescription, "John Smith was in charge ofwriting code at HSBC")
        XCTAssertEqual(workEntry.startDate.monthYearString, "Jan, 2011")
        XCTAssertEqual(workEntry.endDate!.monthYearString, "Jan, 2012")
    }
}
