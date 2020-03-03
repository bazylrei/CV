import UIKit

class Person: NSObject, Codable {
    let firstName: String
    let middleName: String?
    let lastName: String
    let nationality: String
    let dateOfBirth: Date
    let availableFrom: Date?
}
