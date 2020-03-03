import UIKit

class CVLocalService: NSObject, CVServiceType {
    func getCVs() {
        if let path = Bundle.main.path(forResource: "LocalCVList", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .formatted(formatter)
                let list = try jsonDecoder.decode(CVListResponse.self, from: data)
                print(list)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
