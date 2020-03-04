import XCTest
@testable import CV

class CourseTests: XCTestCase {
    func testExampleCourse() {
        let course = Course.exampleCourse
        XCTAssertEqual(course.name, "soft skills academy")
        XCTAssertEqual(course.shortDescription!, "Quick course teaching the essentials of soft skills used in a news presenting company")
    }
}
