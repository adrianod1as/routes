import LoginInterface
import RouterServiceInterface
import UIKit

enum HomeAction {
    case settings
    case profile
    case help
    case login
}

protocol HomeCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: HomeAction)
}

final class HomeCoordinator {
    typealias Dependencies = HasRouterService
    private let dependencies: Dependencies

    weak var viewController: UIViewController?

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - HomeCoordinating
extension HomeCoordinator: HomeCoordinating {
    func perform(action: HomeAction) {
        guard let viewController = viewController else { return }
        switch action {
        case .login:
            dependencies.routerService.navigate(
                toRoute: LoginRoute(),
                fromView: viewController,
                presentationStyle: Replace(),
                animated: true
            )
        default:
            break
        }
    }
}
