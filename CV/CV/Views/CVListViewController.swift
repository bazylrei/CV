import UIKit

class CVListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel: CVListViewModelType = CVListViewModel()
    let cellReuseIdentifier = "CVListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = viewModel.title
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.fetchCVList { [weak self] in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension CVListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cv = viewModel.cv(at: indexPath.row)
        viewModel.presentDetails(for: cv)
    }
}

extension CVListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let cv = viewModel.cv(at: indexPath.row)
        cell.textLabel?.text = cv.person.firstName
        return cell
    }
}
