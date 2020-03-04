import Foundation

class WorkEntry: NSObject, Codable {
    let companyName: String
    let imageURLString: String?
    let position: String
    let responsibilities: [String]?
    let shortDescription: String?
    let startDate: Date
    let endDate: Date?
}

extension WorkEntry: CellDisplayable {
    func cellDisplayableDetails() -> CellDisplayableViewModel {
        let responsibilitiesString = responsibilities?
            .map{"· \($0)"}
            .joined(separator: "\n")
        var imageURL: URL?
        if let imageURLString = imageURLString {
            imageURL = URL(string: imageURLString)
        }
        return CellDisplayableViewModel(imageURL: imageURL,
                                        title: companyName,
                                        detail: position,
                                        subtitle: responsibilitiesString)
    }
}
