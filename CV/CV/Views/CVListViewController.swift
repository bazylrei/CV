import UIKit

class CVListViewController: UIViewController {

    let viewModel: CVListViewModelType = CVListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCVList()
    }

}
