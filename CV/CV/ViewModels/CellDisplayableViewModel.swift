import UIKit

class CellDisplayableViewModel {
    let title: String
    let detail: String?
    let subtitle: String?
    
    init(title: String, detail: String?, subtitle: String?) {
        self.title = title
        self.detail = detail
        self.subtitle = subtitle
    }
}
