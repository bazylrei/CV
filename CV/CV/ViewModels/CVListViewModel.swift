import UIKit

protocol CVListViewModelType {
    var title: String { get }
    func fetchCVList(completion: @escaping (() -> Void))
    var numberOfRows: Int { get }
    func cv(at index: Int) -> CV
    func presentDetails(for cv: CV)
}

class CVListViewModel: CVListViewModelType {
    
    private let api: CVAPIType
    private let appRouter: AppRouterType
    private var cvList = [CV]()
    
    var title: String {
        return "CVListViewModel.title".localized
    }

    init(api: CVAPIType = CVAPI(), appRouter: AppRouterType = AppRouter()) {
        self.api = api
        self.appRouter = appRouter
    }
    
    func fetchCVList(completion: @escaping (() -> Void)) {
        api.fetchCVs { [weak self] cvs in
            self?.cvList = cvs
            completion()
        }
    }
        
    var numberOfRows: Int {
        return cvList.count
    }
    
    func cv(at index: Int) -> CV {
        return cvList[index]
    }
    
    func presentDetails(for cv: CV) {
        appRouter.presentCVDetails(with: cv)
    }
}
