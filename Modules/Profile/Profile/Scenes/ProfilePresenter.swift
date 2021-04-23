import Foundation

protocol ProfilePresenting: AnyObject {
    var viewController: ProfileDisplaying? { get set }
    func displaySomething()
    func didNextStep(action: ProfileAction)
}

final class ProfilePresenter {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let coordinator: ProfileCoordinating
    weak var viewController: ProfileDisplaying?

    init(coordinator: ProfileCoordinating, dependencies: Dependencies) {
        self.coordinator = coordinator
        self.dependencies = dependencies
    }
}

// MARK: - ProfilePresenting
extension ProfilePresenter: ProfilePresenting {
    func displaySomething() {
        viewController?.displaySomething()
    }
    
    func didNextStep(action: ProfileAction) {
        coordinator.perform(action: action)
    }
}
