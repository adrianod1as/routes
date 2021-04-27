import HomeInterface
import HTTPClientInterface
import RouterServiceInterface
import UIKit

typealias HomeDependencyContainer = HasNoDependency & HasHTTPClient & HasRouterService

public struct HomeFeature: Feature, HomeDependencyContainer {
    @Dependency public var httpClient: HTTPClienting
    @Dependency public var routerService: RouterServiceProtocol

    public init() {}

    public func build(fromRoute route: Route?) -> UIViewController {
        guard let route = route as? HomeRoute else {
            fatalError("Could not cast route")
        }
        let container = /* DependencyContainer(httpClient) */ self
        //        return HomeFactory.make(with: container)
        let service: HomeServicing = HomeService(dependencies: container)
        let coordinator: HomeCoordinating = HomeCoordinator(dependencies: container)
        let presenter: HomePresenting = HomePresenter(coordinator: coordinator, dependencies: container)
        let interactor = HomeInteractor(username: route.username, service: service, presenter: presenter, dependencies: container)
        let viewController = HomeViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
