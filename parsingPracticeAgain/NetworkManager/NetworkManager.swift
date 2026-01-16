import UIKit

final class NetworkManager: UIViewController {
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
}
