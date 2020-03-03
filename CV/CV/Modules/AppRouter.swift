import UIKit

enum Screen {
    case cvList
    case cvDetail(CV)
    
    var identifier: String {
        switch self {
        case .cvList:
            return String(describing: CVListViewController.self)
        case .cvDetail(_):
            return String(describing: CVDetailsViewController.self)
        }
    }
}

protocol AppRouterType {
    func presentCVDetails(with cv: CV)
    func pop()
}

class AppRouter: AppRouterType {
    func presentCVDetails(with cv: CV) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: Screen.cvDetail(cv).identifier) as? CVDetailsViewController else {
            return
        }
        let viewModel = CVDetailsViewModel(cv: cv)
        vc.viewModel = viewModel
        navController?.pushViewController(vc, animated: true)
    }
    
    func pop() {
        navController?.popViewController(animated: true)
    }
    
    lazy var navController: UINavigationController? = {
        guard let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else {
            return nil
        }
        return navController
    }()
}
