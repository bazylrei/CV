@testable import CV

extension Training {
    static var exampleTraining: Training {
        let fileName = "ExampleTraining"
        return FileDeserialiser.getObject(from: fileName, returningClass: Training.self)!
    }
}
