import Foundation

protocol CVServiceType {
    func getCVs(completion: @escaping (([CV]) -> Swift.Void))
}

class CVGistService: NSObject, CVServiceType {
    func getCVs(completion: @escaping ([CV]) -> Swift.Void) {
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
                    let formatter = DateFormatter()
                    formatter.locale = Locale(identifier: "en_US_POSIX")
                    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .formatted(formatter)
                    let cvResponse = try jsonDecoder.decode(CVListResponse.self,
                                                            from: data)
                    completion(cvResponse.data)
                } catch {
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
    }
}
