import UIKit

class CVListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel: CVListViewModelType = CVListViewModel()
    let cellReuseIdentifier = "CVListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.fetchCVList { [weak self] in
            guard let self = self else {
                return
            }
            self.tableView.reloadData()
        }
    }
}

extension CVListViewController: UITableViewDelegate {
    
}

extension CVListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
            return UITableViewCell()
        }
        let cv = viewModel.cv(at: indexPath.row)
        cell.textLabel?.text = cv.person.firstName
        return cell
        
    }
    
    
}
