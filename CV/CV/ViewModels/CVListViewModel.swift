import UIKit

protocol CVListViewModelType {
    func fetchCVList()
}

class CVListViewModel: CVListViewModelType {
    let api: CVAPIType = CVAPI()
    
    func fetchCVList() {
        api.fetchCVs()
    }
}
