import UIKit

protocol AppRouterType {
    func presentCVDetails(with cv: CV)
    func pop()
}

class AppRouter: AppRouterType {
    func presentCVDetails(with cv: CV) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "CVDetailsViewController")
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
