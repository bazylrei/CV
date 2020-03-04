import Foundation

extension Date {
    var monthYearString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM, yyyy"
        return dateFormatter.string(from: self)
    }
}
