import UIKit

extension UIImageView {
    func setImageAsync(with url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                }
            }
        }.resume()
    }
}
