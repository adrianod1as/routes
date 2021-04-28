import HTTPClientInterface
import RouterServiceInterface
import UIKit

typealias HelpDependencyContainer = HasNoDependency & HasHTTPClient & HasRouterService

public struct HelpFeature: Feature, HelpDependencyContainer {
    @Dependency public var httpClient: HTTPClienting
    @Dependency public var routerService: RouterServiceProtocol

    public init() {}

    public func build(fromRoute route: Route?) -> UIViewController {
        let container = self
        //        return HelpFactory.make(with: container)
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
