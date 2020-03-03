import Foundation

class CV: NSObject, Codable {
    let person: Person
    let workEntries: [WorkEntry]?
    let courses: [Course]?
    let trainings: [Training]?
    let skills: [Skill]?
}
