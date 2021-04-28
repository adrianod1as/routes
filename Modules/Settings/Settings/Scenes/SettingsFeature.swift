import HTTPClientInterface
import RouterServiceInterface
import UIKit

typealias SettingsDependencyContainer = HasNoDependency & HasHTTPClient & HasRouterService

public struct SettingsFeature: Feature, SettingsDependencyContainer {
    @Dependency public var httpClient: HTTPClienting
    @Dependency public var routerService: RouterServiceProtocol

    public init() {}

    public func build(fromRoute route: Route?) -> UIViewController {
        let container = self
        //        return SettingsFactory.make(with: container)
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
