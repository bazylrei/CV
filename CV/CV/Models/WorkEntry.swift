import Foundation

class WorkEntry: NSObject, Codable {
    let companyName: String
    let position: String
    let responsibilities: [String]?
    let shortDescription: String?
    let startDate: Date
    let endDate: Date?
}

extension WorkEntry: CellDisplayable {
    func cellDisplayableDetails() -> CellDisplayableViewModel {
         let responsibilitiesString = responsibilities?.reduce("", { (result, nextItem) -> String in
            "\(result)\n\(nextItem)"
        })
        return CellDisplayableViewModel(title: companyName,
                                        detail: position,
                                        subtitle: responsibilitiesString)
    }
}
