import HTTPClientInterface
import RouterServiceInterface
import UIKit

typealias LoginDependencyContainer = HasNoDependency & HasHTTPClient & HasRouterService

public struct LoginFeature: Feature, LoginDependencyContainer {
    @Dependency public var httpClient: HTTPClienting
    @Dependency public var routerService: RouterServiceProtocol

    public init() {}

    public func build(fromRoute route: Route?) -> UIViewController {
        let container = self
//        return LoginFactory.make(with: container)
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
