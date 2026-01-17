import UIKit

final class ViewController: UIViewController {
    
    let networkManager = NetworkManager.shared
    
    private lazy var parseJSONButton: UIButton = {
        let parseJSONButton = FilledButtonFactory(
            title: "Take Data",
            color: .red,
            action: UIAction { [unowned self] _ in
                parseJSONFromWeb()
            }
        )
        return parseJSONButton.createButton()
    }()

    private lazy var sendJSONButton: UIButton = {
        let sendJSONButton = FilledButtonFactory(
            title: "Send Data",
            color: .yellow,
            action: UIAction { [unowned self] _ in
                sendJSONToWeb()
            }
        )
        return sendJSONButton.createButton()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        setElements(parseJSONButton, sendJSONButton)
        setConstraints()
    }


}

// MARK: - Parse Funcs
private extension ViewController {
    func parseJSONFromWeb() {
        networkManager.toParseData(from: Links.dataTakeURL.url) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func sendJSONToWeb() {
        networkManager.toSendData(with: parameters, to: Links.dataSendURL.url) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}

//  MARK: - Constraints and Set Buttons
private extension ViewController {
    func setElements(_ subView: UIView...) {
        subView.forEach{ theElement in
            view.addSubview(theElement)
        }
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            parseJSONButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            parseJSONButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            parseJSONButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            sendJSONButton.topAnchor.constraint(equalTo: parseJSONButton.topAnchor, constant: 40),
            sendJSONButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sendJSONButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

#Preview {
    ViewController()
}

