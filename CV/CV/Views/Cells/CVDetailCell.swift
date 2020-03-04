import UIKit

class CVDetailCell: UITableViewCell {

    private let titleLabel = UILabel()
    private let detailLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    private let marginSize = CGFloat(12.0)
    
    func setup(with displayData: CellDisplayableViewModel?) {
        guard let displayData = displayData else {
            print("no details to display in cell")
            return
        }
        self.titleLabel.text = displayData.title
        self.detailLabel.text = displayData.detail
        self.subtitleLabel.text = displayData.subtitle
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        subtitleLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        titleLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: marginSize).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: marginSize).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4).isActive = true
    
        
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.textAlignment = .right
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
        detailLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(detailLabel)
        detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -marginSize).isActive = true
        detailLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: marginSize).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10).isActive = true
        detailLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor).isActive = true
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .left
        subtitleLabel.numberOfLines = 0
        subtitleLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .ultraLight)
        subtitleLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(subtitleLabel)
        subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -marginSize).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: marginSize).isActive = true
        subtitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -2 * marginSize).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -marginSize).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 1.0).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
