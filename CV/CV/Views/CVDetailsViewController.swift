import UIKit

class CVDetailsViewController: UIViewController {
    
    let viewModel: CVDetailsViewModelType
    let cellReuseIdentifier = String(describing: CVDetailCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.title = viewModel.title
    }
    
    init(viewModel: CVDetailsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        let tableView = UITableView()
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let centerXConstraint = NSLayoutConstraint(item: tableView,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerX,
                                                   multiplier: 1.0,
                                                   constant: 0.0)
        let centerYConstraint = NSLayoutConstraint(item: tableView,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerY,
                                                   multiplier: 1.0,
                                                   constant: 0.0)
        let leadingConstraint = NSLayoutConstraint(item: tableView,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .width,
                                                   multiplier: 1.0,
                                                   constant: 0.0)
        let topConstraint = NSLayoutConstraint(item: tableView,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .height,
                                               multiplier: 1.0,
                                               constant: 0.0)
        view.addConstraints([centerXConstraint,
                             centerYConstraint,
                             leadingConstraint,
                             topConstraint])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CVDetailCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
}

extension CVDetailsViewController: UITableViewDelegate {
}

extension CVDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let text = viewModel.info(for: indexPath)
        cell.textLabel?.text = text
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.title(for: section)
    }
    
}
