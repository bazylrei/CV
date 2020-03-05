import XCTest
@testable import CV

class TrainingTests: XCTestCase {
    func testExampleTraining() {
        let training = Training.exampleTraining
        let detail = training.cellDisplayableDetails()
        XCTAssertEqual(detail.title, "Swift basics")
        XCTAssertEqual(detail.subtitle!, "Decided to try out my skills in software development by attending a Swift course in Cupertino, think I\'ll stick to presenting")
        XCTAssertEqual(detail.detail, "Cupertino, California")
        XCTAssertNil(detail.imageURL)
    }
}
