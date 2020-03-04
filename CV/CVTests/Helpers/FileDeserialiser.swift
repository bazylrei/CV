import UIKit
@testable import CV

class FileDeserialiser: NSObject {
    static func getObject<T: Codable>(from fileName: String, returningClass: T.Type) -> T? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .formatted(.enUSPosix)
                let response = try jsonDecoder.decode(returningClass, from: data)
                return response
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
