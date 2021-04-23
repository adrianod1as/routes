import Foundation

protocol HomePresenting: AnyObject {
    var viewController: HomeDisplaying? { get set }
    func displaySomething()
    func didNextStep(action: HomeAction)
}

final class HomePresenter {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let coordinator: HomeCoordinating
    weak var viewController: HomeDisplaying?

    init(coordinator: HomeCoordinating, dependencies: Dependencies) {
        self.coordinator = coordinator
        self.dependencies = dependencies
    }
}

// MARK: - HomePresenting
extension HomePresenter: HomePresenting {
    func displaySomething() {
        viewController?.displaySomething()
    }
    
    func didNextStep(action: HomeAction) {
        coordinator.perform(action: action)
    }
}
