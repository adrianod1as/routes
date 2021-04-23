import UIKit

public enum HomeFactory {
    public static func make() -> UIViewController {
        let container = DependencyContainer()
        let service: HomeServicing = HomeService(dependencies: container)
        let coordinator: HomeCoordinating = HomeCoordinator(dependencies: container)
        let presenter: HomePresenting = HomePresenter(coordinator: coordinator, dependencies: container)
        let interactor = HomeInteractor(service: service, presenter: presenter, dependencies: container)
        let viewController = HomeViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
