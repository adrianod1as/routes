import UIKit

public enum RegistrationFactory {
    public static func make() -> UIViewController {
        let container = DependencyContainer()
        let service: RegistrationServicing = RegistrationService(dependencies: container)
        let coordinator: RegistrationCoordinating = RegistrationCoordinator(dependencies: container)
        let presenter: RegistrationPresenting = RegistrationPresenter(coordinator: coordinator, dependencies: container)
        let interactor = RegistrationInteractor(service: service, presenter: presenter, dependencies: container)
        let viewController = RegistrationViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
