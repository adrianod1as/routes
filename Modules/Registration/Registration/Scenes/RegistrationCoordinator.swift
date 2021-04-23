import UIKit

enum RegistrationAction {
}

protocol RegistrationCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: RegistrationAction)
}

final class RegistrationCoordinator {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    weak var viewController: UIViewController?

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - RegistrationCoordinating
extension RegistrationCoordinator: RegistrationCoordinating {
    func perform(action: RegistrationAction) {
    }
}
