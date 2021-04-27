import HTTPClientInterface
import UIKit

enum LoginFactory {
    static func make(with container: LoginDependencyContainer) -> UIViewController {
        let service: LoginServicing = LoginService(dependencies: container)
        let coordinator: LoginCoordinating = LoginCoordinator(dependencies: container)
        let presenter: LoginPresenting = LoginPresenter(coordinator: coordinator, dependencies: container)
        let interactor = LoginInteractor(service: service, presenter: presenter, dependencies: container)
        let viewController = LoginViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
