import XCTest
@testable import CV

extension WorkEntry {
    static var exampleWorkEntry: WorkEntry {
        let fileName = "ExampleWorkEntry"
        return FileDeserialiser.getObject(from: fileName, returningClass: WorkEntry.self)!
    }
}
