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
        let responsibilitiesString = responsibilities?
            .map{"· \($0)"}
            .joined(separator: "\n")
//         let responsibilitiesString = responsibilities?.reduce("", { (result, nextItem) -> String in
//            "\(result)· \(nextItem)\n".trimmingCharacters(in: .whitespacesAndNewlines)
//        })
        return CellDisplayableViewModel(title: companyName,
                                        detail: position,
                                        subtitle: responsibilitiesString)
    }
}
