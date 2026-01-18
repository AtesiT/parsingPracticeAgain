import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowsScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = ViewControllerAF()
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

