import Foundation

protocol CVAPIType {
    func fetchCVs(completion: @escaping (([CV]) -> Swift.Void))
    func fetchCV(with identifier: String)
}

class CVAPI: NSObject, CVAPIType {
    let cvService: CVServiceType = CVLocalService()
    
    func fetchCVs(completion: @escaping (([CV]) -> Swift.Void)) {
        cvService.getCVs { CVs in
            completion(CVs)
        }
    }
    
    func fetchCV(with identifier: String) {
    }
}
