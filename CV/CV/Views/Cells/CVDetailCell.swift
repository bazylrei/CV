import UIKit

class CVDetailCell: UITableViewCell {

    func setup(with displayData: CellDisplayableViewModel?) {
        guard let displayData = displayData else {
            print("no details to display in cell")
            return
        }
        self.textLabel?.text = displayData.title
        self.detailTextLabel?.text = displayData.subtitle
    }
}
