import UIKit

class CVDetailCell: UITableViewCell {

    private let iconImage = UIImageView()
    private let titleLabel = UILabel()
    private let detailLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    private var imageHeightConstraint = NSLayoutConstraint()
    
    private let marginSize = CGFloat(12.0)
    private let imageDimension = CGFloat(40.0)
    
    private func setup(with displayData: CellDisplayableViewModel?) {
        guard let displayData = displayData else {
            print("no details to display in cell")
            return
        }
        self.titleLabel.text = displayData.title
        self.detailLabel.text = displayData.detail
        self.subtitleLabel.text = displayData.subtitle
        
        if let imageURL = displayData.imageURL {
            imageHeightConstraint.constant = imageDimension
            self.iconImage.setImageAsync(with: imageURL)
        } else {
            imageHeightConstraint.constant = CGFloat(0.0)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        contentView.addSubview(subtitleLabel)
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.contentMode = .scaleAspectFit
        
        iconImage.widthAnchor.constraint(equalToConstant: imageDimension).isActive = true
        imageHeightConstraint = iconImage.heightAnchor.constraint(equalToConstant: imageDimension)
        imageHeightConstraint.isActive = true
        iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: marginSize).isActive = true
        iconImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: marginSize).isActive = true
        iconImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -marginSize).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        titleLabel.adjustsFontSizeToFitWidth = true
        
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: marginSize).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4).isActive = true
    
        
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.textAlignment = .right
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
        detailLabel.adjustsFontSizeToFitWidth = true
        
        detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -marginSize).isActive = true
        detailLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10).isActive = true
        detailLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor).isActive = true
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .left
        subtitleLabel.numberOfLines = 0
        subtitleLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .ultraLight)
        subtitleLabel.adjustsFontSizeToFitWidth = true
        
        subtitleLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: marginSize).isActive = true
        subtitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -2 * marginSize).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -marginSize).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 1.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
