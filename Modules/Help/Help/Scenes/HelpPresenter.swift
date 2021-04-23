import Foundation

protocol HelpPresenting: AnyObject {
    var viewController: HelpDisplaying? { get set }
    func displaySomething()
    func didNextStep(action: HelpAction)
}

final class HelpPresenter {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let coordinator: HelpCoordinating
    weak var viewController: HelpDisplaying?

    init(coordinator: HelpCoordinating, dependencies: Dependencies) {
        self.coordinator = coordinator
        self.dependencies = dependencies
    }
}

// MARK: - HelpPresenting
extension HelpPresenter: HelpPresenting {
    func displaySomething() {
        viewController?.displaySomething()
    }
    
    func didNextStep(action: HelpAction) {
        coordinator.perform(action: action)
    }
}
