import XCTest
@testable import CV

extension CV {
    static var exampleCV: CV {
        let fileName = "LocalCVList"
        
        let CVResponse = FileDeserialiser.getObject(from: fileName, returningClass: CVListResponse.self)
        return CVResponse!.data[0]
    }
    
    static var emptyCVJustPerson: CV {
        let fileName = "CVOnlyPerson"
        return FileDeserialiser.getObject(from: fileName, returningClass: CV.self)!
    }
}
