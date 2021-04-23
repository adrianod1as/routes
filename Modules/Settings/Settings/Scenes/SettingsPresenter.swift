import Foundation

protocol SettingsPresenting: AnyObject {
    var viewController: SettingsDisplaying? { get set }
    func displaySomething()
    func didNextStep(action: SettingsAction)
}

final class SettingsPresenter {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let coordinator: SettingsCoordinating
    weak var viewController: SettingsDisplaying?

    init(coordinator: SettingsCoordinating, dependencies: Dependencies) {
        self.coordinator = coordinator
        self.dependencies = dependencies
    }
}

// MARK: - SettingsPresenting
extension SettingsPresenter: SettingsPresenting {
    func displaySomething() {
        viewController?.displaySomething()
    }
    
    func didNextStep(action: SettingsAction) {
        coordinator.perform(action: action)
    }
}
