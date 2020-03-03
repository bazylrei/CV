import UIKit

protocol CVListViewModelType {
    func fetchCVList(completion: @escaping (() -> Void))
    var numberOfRows: Int { get }
    func cv(at index: Int) -> CV
}

class CVListViewModel: CVListViewModelType {
    private let api: CVAPIType = CVAPI()
    private var cvList = [CV]()
    
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
}
