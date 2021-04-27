import HTTPClientInterface
import RouterServiceInterface
import UIKit

typealias RegistrationDependencyContainer = HasNoDependency & HasHTTPClient & HasRouterService

public struct RegistrationFeature: Feature, RegistrationDependencyContainer {
    @Dependency public var httpClient: HTTPClienting
    @Dependency public var routerService: RouterServiceProtocol

    public init() {}

    public func build(fromRoute route: Route?) -> UIViewController {
        let container = /* DependencyContainer(httpClient) */ self
        //        return RegistrationFactory.make(with: container)
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
