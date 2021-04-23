import UIKit

enum ProfileAction {
}

protocol ProfileCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: ProfileAction)
}

final class ProfileCoordinator {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    weak var viewController: UIViewController?

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - ProfileCoordinating
extension ProfileCoordinator: ProfileCoordinating {
    func perform(action: ProfileAction) {
    }
}
