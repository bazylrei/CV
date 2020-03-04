import UIKit

enum Screen {
    case cvList
    case cvDetail
    
    var identifier: String {
        switch self {
        case .cvList:
            return String(describing: CVListViewController.self)
        case .cvDetail:
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
        let viewModel = CVDetailsViewModel(cv: cv)
        let vc = CVDetailsViewController(viewModel: viewModel)
        navController?.pushViewController(vc, animated: true)
    }
    
    func pop() {
        navController?.popViewController(animated: true)
    }
    
    private lazy var navController: UINavigationController? = {
        guard let navController = keyWindow?.rootViewController as? UINavigationController else {
            return nil
        }
        return navController
    }()
    
    private lazy var keyWindow: UIWindow? = {
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    }()
}
