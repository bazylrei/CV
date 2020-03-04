import XCTest
@testable import CV

class CVTests: XCTestCase {
    func testExampleCV() {
        let cv = CV.exampleCV
        XCTAssertEqual(cv.person.firstName, "Jonathan")
        XCTAssertEqual(cv.workEntries!.count, 2)
        XCTAssertEqual(cv.courses!.count, 2)
        XCTAssertEqual(cv.trainings!.count, 1)
        XCTAssertEqual(cv.skills!.count, 1)
    }
    
    func testEmptyCVJustPerson() {
        let cv = CV.emptyCVJustPerson
        XCTAssertEqual(cv.person.firstName, "Matthew")
        XCTAssertNil(cv.workEntries)
        XCTAssertNil(cv.courses)
        XCTAssertNil(cv.trainings)
        XCTAssertNil(cv.skills)
    }
}
