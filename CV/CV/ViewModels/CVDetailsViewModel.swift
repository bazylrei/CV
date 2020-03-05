import Foundation

enum Section: Int, CaseIterable {
    case workEntries
    case courses
    case trainings
    case skills
    
    var title: String {
        switch self {
        case .workEntries:
            return "Previous positions".localized
        case .courses:
            return "Completed courses".localized
        case .trainings:
            return "Trainings".localized
        case .skills:
            return "Skills".localized
        }
    }
}

protocol CVDetailsViewModelType {
    var title: String { get }
    var numberOfSections: Int { get }
    func numberOfRows(for section: Int) -> Int
    func title(for section: Int) -> String?
    func info(for index: IndexPath) -> CellDisplayableViewModel?
}

class CVDetailsViewModel: NSObject, CVDetailsViewModelType {
    private var cv: CV
    
    init(cv: CV) {
        self.cv = cv
        super.init()
    }

    var title: String {
        return "\(cv.person.firstName) \(cv.person.lastName)"
    }
    
    lazy var numberOfSections: Int = {
        return Section.allCases.count
    }()
    
    func numberOfRows(for section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            return 0
        }
        switch section {
        case .workEntries:
            return cv.workEntries?.count ?? 0
        case .courses:
            return cv.courses?.count ?? 0
        case .trainings:
            return cv.trainings?.count ?? 0
        case .skills:
            return cv.skills?.count ?? 0
        }
    }
    
    func title(for section: Int) -> String? {
        return Section(rawValue: section)?.title
    }
    
    func info(for index: IndexPath) -> CellDisplayableViewModel? {
        guard let section = Section(rawValue: index.section) else {
            return nil
        }
        switch section {
        case .workEntries:
            return cv.workEntries?[index.item].cellDisplayableDetails()
        case .courses:
            return cv.courses?[index.item].cellDisplayableDetails()
        case .trainings:
            return cv.trainings?[index.item].cellDisplayableDetails()
        case .skills:
            return cv.skills?[index.item].cellDisplayableDetails()
        }
    }
}
