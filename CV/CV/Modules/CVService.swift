import Foundation

protocol CVServiceType {
    func getCVs()
}

class CVService: NSObject {
    func getCVs() {
        guard let url = URL(string: "\(URLs.base)\(URLs.CVList)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("failed to download CVs - \(error.localizedDescription)")
                return
            }
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let list = try jsonDecoder.decode([CV].self, from: data)
                    print(list)
                } catch {
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
    }
}
