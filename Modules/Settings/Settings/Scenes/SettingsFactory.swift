import UIKit

enum SettingsFactory {
    static func make(with container: SettingsDependencyContainer) -> UIViewController {
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
