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
    func numberOfRows(for section: Int) -> Int
    func title(for section: Int) -> String?
    func info(for index: IndexPath) -> String?
}

class CVDetailsViewModel: NSObject, CVDetailsViewModelType {
    var cv: CV?
    
    init(cv: CV) {
        super.init()
        self.cv = cv
    }
    
    override init() {
        super.init()
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
    
    func numberOfRows(for section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            return 0
        }
        switch section {
        case .workEntries:
            return cv?.workEntries?.count ?? 0
        case .courses:
            return cv?.courses?.count ?? 0
        case .trainings:
            return cv?.trainings?.count ?? 0
        case .skills:
            return cv?.skills?.count ?? 0
        }
    }
    
    func title(for section: Int) -> String? {
        return Section(rawValue: section)?.title
    }
    
    func info(for index: IndexPath) -> String? {
        guard let section = Section(rawValue: index.section) else {
            return nil
        }
        switch section {
        case .workEntries:
            return cv?.workEntries?[index.item].companyName
        case .courses:
            return cv?.courses?[index.item].name
        case .trainings:
            return cv?.trainings?[index.item].name
        case .skills:
            return cv?.skills?[index.item].name
        }
    }
}
