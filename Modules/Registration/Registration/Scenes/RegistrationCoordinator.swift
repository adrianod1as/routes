import HomeInterface
import RouterServiceInterface
import UIKit

enum RegistrationAction {
    case home
}

protocol RegistrationCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: RegistrationAction)
}

final class RegistrationCoordinator {
    typealias Dependencies = HasRouterService
    private let dependencies: Dependencies

    weak var viewController: UIViewController?

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - RegistrationCoordinating
extension RegistrationCoordinator: RegistrationCoordinating {
    func perform(action: RegistrationAction) {
        guard let viewController = viewController else { return }
        dependencies.routerService.navigate(
            toRoute: HomeRoute(username: "New User"),
            fromView: viewController,
            presentationStyle: Replace(),
            animated: true
        )
    }
}
