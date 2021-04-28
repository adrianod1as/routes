import HelpInterface
import LoginInterface
import ProfileInterface
import RouterServiceInterface
import UIKit

enum SettingsAction {
    case profile
    case help
    case login
}

protocol SettingsCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: SettingsAction)
}

final class SettingsCoordinator {
    typealias Dependencies = HasRouterService
    private let dependencies: Dependencies

    weak var viewController: UIViewController?

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - SettingsCoordinating
extension SettingsCoordinator: SettingsCoordinating {
    func perform(action: SettingsAction) {
        guard let viewController = viewController else { return }
        dependencies.routerService.navigate(
            toRoute: action.asRoute,
            fromView: viewController,
            presentationStyle: action.asPresentationStyle,
            animated: true
        )
    }
}

private extension SettingsAction {
    var asRoute: Route {
        switch self {
        case .profile:
            return ProfileRoute()
        case .help:
            return HelpRoute()
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
