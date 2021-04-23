import UIKit

public enum SettingsFactory {
    public static func make() -> UIViewController {
        let container = DependencyContainer()
        let service: SettingsServicing = SettingsService(dependencies: container)
        let coordinator: SettingsCoordinating = SettingsCoordinator(dependencies: container)
        let presenter: SettingsPresenting = SettingsPresenter(coordinator: coordinator, dependencies: container)
        let interactor = SettingsInteractor(service: service, presenter: presenter, dependencies: container)
        let viewController = SettingsViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
