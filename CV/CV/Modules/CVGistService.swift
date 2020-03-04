import Foundation

protocol CVServiceType {
    func getCVs(completion: @escaping (([CV]) -> Void))
}

class CVGistService: NSObject, CVServiceType {
    func getCVs(completion: @escaping ([CV]) -> Void) {
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
                    jsonDecoder.dateDecodingStrategy = .formatted(.enUSPosix)
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
