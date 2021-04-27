import HTTPClientInterface
import UIKit

enum HomeFactory {
    static func make(with container: HomeDependencyContainer) -> UIViewController {
        let service: HomeServicing = HomeService(dependencies: container)
        let coordinator: HomeCoordinating = HomeCoordinator(dependencies: container)
        let presenter: HomePresenting = HomePresenter(coordinator: coordinator, dependencies: container)
        let interactor = HomeInteractor(username: String(), service: service, presenter: presenter, dependencies: container)
        let viewController = HomeViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
