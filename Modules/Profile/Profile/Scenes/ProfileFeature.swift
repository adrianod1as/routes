import HTTPClientInterface
import RouterServiceInterface
import UIKit

typealias ProfileDependencyContainer = HasNoDependency & HasHTTPClient & HasRouterService

public struct ProfileFeature: Feature, ProfileDependencyContainer {
    @Dependency public var httpClient: HTTPClienting
    @Dependency public var routerService: RouterServiceProtocol

    public init() {}

    public func build(fromRoute route: Route?) -> UIViewController {
        let container = self
        //        return ProfileFactory.make(with: container)
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
