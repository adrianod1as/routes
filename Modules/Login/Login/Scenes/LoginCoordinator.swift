import UIKit

enum LoginAction {
}

protocol LoginCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: LoginAction)
}

final class LoginCoordinator {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    weak var viewController: UIViewController?

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - LoginCoordinating
extension LoginCoordinator: LoginCoordinating {
    func perform(action: LoginAction) {
    }
}
