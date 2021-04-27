import Foundation

protocol HomePresenting: AnyObject {
    var viewController: HomeDisplaying? { get set }
    func present(username: String)
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
    func present(username: String) {
        viewController?.diplay(title: "\(username)'s Home")
    }
    
    func didNextStep(action: HomeAction) {
        coordinator.perform(action: action)
    }
}
