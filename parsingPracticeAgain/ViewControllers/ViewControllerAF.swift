import UIKit

final class ViewControllerAF: UIViewController {
    
    let networkManagerAF = NetworkManagerAlamofire.shared
    
    private lazy var getJSONButton: UIButton = {
        let getJSONButton = FilledButtonFactory(
            title: "Get JSON",
            color: .green,
            action: UIAction { [unowned self] _ in
                getJSON()
            }
        )
        return getJSONButton.createButton()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setElements(getJSONButton)
        setConstrains()
    }
    
    func getJSON() {
        networkManagerAF.parseJSON(from: Links.dataTakeURL.url) { result in
        switch result {
        case .success(let data):
            print(data)
        case .failure(let error):
            print(error)
            }
        }
    }
}

private extension ViewControllerAF {
    func setConstrains() {
        NSLayoutConstraint.activate([
            getJSONButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            getJSONButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            getJSONButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    func setElements(_ subView: UIView...) {
        subView.forEach { theView in
            view.addSubview(theView)
        }
    }
}
