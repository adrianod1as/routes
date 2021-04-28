import HelpInterface
import LoginInterface
import ProfileInterface
import RouterServiceInterface
import SettingsInterface
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
        dependencies.routerService.navigate(
            toRoute: action.asRoute,
            fromView: viewController,
            presentationStyle: action.asPresentationStyle,
            animated: true
        )
    }
}

private extension HomeAction {
    var asRoute: Route {
        switch self {
        case .profile:
            return ProfileRoute()
        case .help:
            return HelpRoute()
        case .settings:
            return SettingsRoute()
        case .login:
            return LoginRoute()
        }
    }

    var asPresentationStyle: PresentationStyle {
        switch self {
        case .login:
            return Replace()
        default:
            return Push()
        }
    }
}
