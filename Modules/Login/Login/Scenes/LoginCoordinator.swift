import HomeInterface
import RegistrationInterface
import RouterServiceInterface
import UIKit

enum LoginAction {
    case home
    case registration
}

protocol LoginCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: LoginAction)
}

final class LoginCoordinator {
    typealias Dependencies = HasRouterService
    private let dependencies: Dependencies

    weak var viewController: UIViewController?

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - LoginCoordinating
extension LoginCoordinator: LoginCoordinating {
    func perform(action: LoginAction) {
        guard let viewController = viewController else { return }
        let route: Route = action == .home ? HomeRoute(username: "Old User") : RegistrationRoute()
        let style: PresentationStyle = action == .home ? Replace() : Push()
        dependencies.routerService.navigate(
            toRoute: route,
            fromView: viewController,
            presentationStyle: style,
            animated: true
        )
    }
}
