import Foundation

protocol CVAPIType {
    func fetchCVs(completion: @escaping (([CV]) -> Swift.Void))
}

class CVAPI: NSObject, CVAPIType {
    private let cvService: CVServiceType = CVLocalService()
    
    func fetchCVs(completion: @escaping (([CV]) -> Swift.Void)) {
        cvService.getCVs { CVs in
            completion(CVs)
        }
    }
}
