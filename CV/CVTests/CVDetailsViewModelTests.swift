//
//  CVDetailsViewModelTests.swift
//  CVTests
//
//  Created by Bazyl Reinstein on 4/3/20.
//  Copyright © 2020 Bazyl Reinstein. All rights reserved.
//

import XCTest
@testable import CV

class CVDetailsViewModelTests: XCTestCase {

    var viewModel: CVDetailsViewModel!
    
    override func setUp() {
        let cv = CV.exampleCV
        viewModel = CVDetailsViewModel(cv: cv)
    }
    
    override func tearDown() {
        viewModel = nil
    }

    func testDetails() {
        XCTAssertEqual(viewModel.numberOfSections, 4)
        XCTAssertEqual(viewModel.title(for: 0), "Previous positions")
        XCTAssertEqual(viewModel.title(for: 1), "Completed courses")
        XCTAssertEqual(viewModel.title(for: 2), "Trainings")
        XCTAssertEqual(viewModel.title(for: 3), "Skills")
        XCTAssertEqual(viewModel.title, "Jonathan Smith")
        XCTAssertEqual(viewModel.numberOfRows(for: 0), 2)
        XCTAssertEqual(viewModel.numberOfRows(for: 1), 2)
        XCTAssertEqual(viewModel.numberOfRows(for: 2), 1)
        XCTAssertEqual(viewModel.numberOfRows(for: 3), 1)
    }
    
    func testDetailRows() {
        let detailForSection0Row1 = viewModel.info(for: IndexPath(row: 1, section: 0))
        XCTAssertEqual(detailForSection0Row1!.title, "BBC\npresenter")
        XCTAssertEqual(detailForSection0Row1!.subtitle, "· preparing material\n· presenting\n· conducting celebrity interviews")
        XCTAssertEqual(detailForSection0Row1!.detail, "Aug, 2009 - Aug, 2019")
        XCTAssertEqual(detailForSection0Row1?.imageURL, URL(string: "https://worldsoccertalk.com/wp-content/uploads/2015/11/bbc-logo.png")!)
        
        let detailForSection3Row0 = viewModel.info(for: IndexPath(row: 0, section: 3))
        XCTAssertEqual(detailForSection3Row0!.title, "delegating responsibilities")
        XCTAssertNil(detailForSection3Row0?.subtitle)
        XCTAssertEqual(detailForSection3Row0!.detail, "basic")
        XCTAssertNil(detailForSection3Row0?.imageURL)
    }
    
}
