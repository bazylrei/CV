import Foundation

protocol CVDetailsViewModelType {
    var cv: CV? { get }
    var title: String { get }
}

class CVDetailsViewModel: CVDetailsViewModelType {
    var cv: CV?
    
    init(cv: CV) {
        self.cv = cv
    }
    
    var title: String {
        guard let cv = cv else {
            return ""
        }
        return "\(cv.person.firstName) \(cv.person.lastName)"
    }
}
