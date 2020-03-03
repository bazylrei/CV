import Foundation

protocol CVAPIType {
    func fetchCVs()
    func fetchCV(with identifier: String)
}

class CVAPI: NSObject, CVAPIType {
    let cvService: CVServiceType = CVLocalService()
    
    func fetchCVs() {
        cvService.getCVs()
    }
    
    func fetchCV(with identifier: String) {
    }
}
