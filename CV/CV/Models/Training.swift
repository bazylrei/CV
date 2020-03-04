import Foundation

class Training: NSObject, Codable {
    let name: String
    let location: String?
    let date: Date?
    let shortDescription: String?
}

extension Training: CellDisplayable {
    func cellDisplayableDetails() -> CellDisplayableViewModel {
        return CellDisplayableViewModel(imageURL: nil,
                                        title: name,
                                        detail: location,
                                        subtitle: shortDescription)
    }
}
