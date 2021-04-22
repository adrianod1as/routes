import UIKit

enum HelpAction {
}

protocol HelpCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: HelpAction)
}

final class HelpCoordinator {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    weak var viewController: UIViewController?

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - HelpCoordinating
extension HelpCoordinator: HelpCoordinating {
    func perform(action: HelpAction) {
    }
}
