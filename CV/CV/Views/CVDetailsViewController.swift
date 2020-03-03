import UIKit

class CVDetailsViewController: UIViewController {
    
    var viewModel: CVDetailsViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.title
    }
}
