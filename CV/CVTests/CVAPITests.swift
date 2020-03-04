import XCTest
@testable import CV

class CVAPITests: XCTestCase {

    let api = CVAPI(service: CVLocalService())

    func testFetchingCVs() {
        api.fetchCVs { CVs in
            XCTAssertEqual(CVs.count, 2)
            let firstCV = CVs[0]
            let firstCVPerson = firstCV.person
            let firstCVPersonName = firstCVPerson.firstName
            XCTAssertEqual(firstCVPersonName, "Jonathan")
            XCTAssertEqual(firstCV.workEntries!.count, 2)
            XCTAssertEqual(firstCV.trainings!.count, 1)
            XCTAssertEqual(firstCV.courses!.count, 2)
            XCTAssertEqual(firstCV.skills!.count, 1)
        }
    }
}
