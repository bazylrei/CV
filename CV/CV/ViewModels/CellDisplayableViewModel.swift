import UIKit

class CellDisplayableViewModel {
    let imageURL: URL?
    let title: String
    let detail: String?
    let subtitle: String?
    
    init(imageURL: URL?, title: String, detail: String?, subtitle: String?) {
        self.imageURL = imageURL
        self.title = title
        self.detail = detail
        self.subtitle = subtitle
    }
}
