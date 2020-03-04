import Foundation

enum SkillLevel: String, Codable {
    case basic
    case novice
    case intermediate
    case advanced
    case expert
}

class Skill: NSObject, Codable {
    let name: String
    let level: SkillLevel
}

extension Skill: CellDisplayable {
    func cellDisplayableDetails() -> CellDisplayableViewModel {
        return CellDisplayableViewModel(title: name,
                                        detail: level.rawValue,
                                        subtitle: nil)
    }
}
