import Foundation

protocol CVAPIType {
    func fetchCVs(completion: @escaping (([CV]) -> Swift.Void))
}

class CVAPI: NSObject, CVAPIType {
    private let cvService: CVServiceType
    
    init(service: CVServiceType = CVLocalService()) {
        self.cvService = service
    }
    
    func fetchCVs(completion: @escaping (([CV]) -> Void)) {
        cvService.getCVs { CVs in
            completion(CVs)
        }
    }
}
