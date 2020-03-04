import UIKit

class CVDetailCell: UITableViewCell {

    let subtitleLabel = UILabel()
    
    func setup(with displayData: CellDisplayableViewModel?) {
        guard let displayData = displayData else {
            print("no details to display in cell")
            return
        }
        self.textLabel?.text = displayData.title
        self.subtitleLabel.text = displayData.detail
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .right
        subtitleLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(subtitleLabel)
        subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12.0).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.0).isActive = true
        subtitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4).isActive = true
        subtitleLabel.heightAnchor.constraint(equalToConstant: 22.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
