import UIKit

class CVLocalService: NSObject, CVServiceType {
    let fileName = "LocalCVList"
    
    func getCVs(completion: @escaping (([CV]) -> Swift.Void)) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .formatted(.enUSPosix)
                let cvResponse = try jsonDecoder.decode(CVListResponse.self, from: data)
                completion(cvResponse.data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
