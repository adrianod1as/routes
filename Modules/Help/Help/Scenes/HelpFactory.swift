import UIKit

public enum HelpFactory {
    public static func make() -> UIViewController {
        let container = DependencyContainer()
        let service: HelpServicing = HelpService(dependencies: container)
        let coordinator: HelpCoordinating = HelpCoordinator(dependencies: container)
        let presenter: HelpPresenting = HelpPresenter(coordinator: coordinator, dependencies: container)
        let interactor = HelpInteractor(service: service, presenter: presenter, dependencies: container)
        let viewController = HelpViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
