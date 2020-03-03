import Foundation

enum Section: Int, CaseIterable {
    case workEntries
    case courses
    case trainings
    case skills
    
    var title: String {
        switch self {
        case .workEntries:
            return "Previous positions"
        case .courses:
            return "Completed courses"
        case .trainings:
            return "Trainings"
        case .skills:
            return "Skills"
        }
    }
}

protocol CVDetailsViewModelType {
    var cv: CV? { get }
    var title: String { get }
    var numberOfSections: Int { get }
    func title(for section: Int) -> String?
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
    
    lazy var numberOfSections: Int = {
        guard let cv = cv else {
            return 0
        }
        return Section.allCases.count
    }()
    
    func title(for section: Int) -> String? {
        return Section(rawValue: section)?.title
    }
}
