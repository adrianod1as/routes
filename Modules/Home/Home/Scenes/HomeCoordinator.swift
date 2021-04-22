import UIKit

enum HomeAction {
}

protocol HomeCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: HomeAction)
}

final class HomeCoordinator {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    weak var viewController: UIViewController?

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - HomeCoordinating
extension HomeCoordinator: HomeCoordinating {
    func perform(action: HomeAction) {
    }
}
