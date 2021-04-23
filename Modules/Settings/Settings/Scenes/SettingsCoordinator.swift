import UIKit

enum SettingsAction {
}

protocol SettingsCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: SettingsAction)
}

final class SettingsCoordinator {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    weak var viewController: UIViewController?

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - SettingsCoordinating
extension SettingsCoordinator: SettingsCoordinating {
    func perform(action: SettingsAction) {
    }
}
