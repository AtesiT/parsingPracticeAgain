import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private func toParseData(from url: URL, data: Data, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "Nothing")
                return
            }
            do {
                let dataJSON = try JSONDecoder().decode(Data.self, from: data)
                completion(.success(dataJSON))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }.resume()
    }
    
    private func toParseImage(from url: URL, completion: @escaping (Result<Data, MyErrors>) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.Error))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    private func toSendData(with parameters: [String:Any], to url: URL, completion: @escaping(Result<Any,MyErrors>) -> Void) {
        let serializedData = try? JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = serializedData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, let response else {
                print(error?.localizedDescription ?? "Nothing")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                completion(.success(json))
            } catch {
                completion(.failure(.Error))
            }
        }.resume()
    }
}
