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
}
