import Foundation

enum Links {
    case dataTakeURL
    case dataSendURL
    case imageTakeURL

    var url: URL {
        switch self {
        case .dataTakeURL:
            return URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        case .dataSendURL:
            return URL(string: "https://jsonplaceholder.typicode.com/posts")!
        case .imageTakeURL:
            return URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/2560px-Google_2015_logo.svg.png")!
        }
    }
}
