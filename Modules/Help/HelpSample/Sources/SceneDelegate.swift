import Help
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let navigationController = UINavigationController(rootViewController: HelpFactory.make())
            window.rootViewController = navigationController
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
