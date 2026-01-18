import Foundation
import Alamofire


final class NetworkManagerAlamofire {
    
    static let shared = NetworkManagerAlamofire()
    
    private init() {}
    
    func parseJSON(from url: URL, completion: @escaping(Result<TheInfo, AFError>) -> Void) {
        AF.request(url).validate().responseJSON { dataResponse in
            switch dataResponse.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func sendJSON(to url: URL, with data: TheInfo, completion: @escaping(Result<TheInfo, AFError>) -> Void) {
        AF.request(url, method: .post, parameters: data, encoder: JSONParameterEncoder(encoder: JSONEncoder()))
            .validate()
            .responseDecodable(of: TheInfo.self) { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
