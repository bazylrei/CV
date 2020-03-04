import XCTest
@testable import CV

extension Course {
    static var exampleCourse: Course {
        let fileName = "ExampleCourse"
        return FileDeserialiser.getObject(from: fileName, returningClass: Course.self)!
    }
}
