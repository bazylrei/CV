import Foundation

class Course: NSObject, Codable {
    let name: String
    let shortDescription: String?
}

extension Course: CellDisplayable {
    func cellDisplayableDetails() -> CellDisplayableViewModel {
        return CellDisplayableViewModel(imageURL: nil,
                                        title: name,
                                        detail: nil,
                                        subtitle: shortDescription)
    }
}
