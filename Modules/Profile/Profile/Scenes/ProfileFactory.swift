import UIKit

public enum ProfileFactory {
    public static func make() -> UIViewController {
        let container = DependencyContainer()
        let service: ProfileServicing = ProfileService(dependencies: container)
        let coordinator: ProfileCoordinating = ProfileCoordinator(dependencies: container)
        let presenter: ProfilePresenting = ProfilePresenter(coordinator: coordinator, dependencies: container)
        let interactor = ProfileInteractor(service: service, presenter: presenter, dependencies: container)
        let viewController = ProfileViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
