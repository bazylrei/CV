import UIKit

class WorkEntry: NSObject, Codable {
    let companyName: String
    let position: String
    let responsibilities: [String]?
    let shortDescription: String
    let startDate: Date
    let endDate: Date?
}
