import Foundation

protocol RegistrationPresenting: AnyObject {
    var viewController: RegistrationDisplaying? { get set }
    func displaySomething()
    func didNextStep(action: RegistrationAction)
}

final class RegistrationPresenter {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let coordinator: RegistrationCoordinating
    weak var viewController: RegistrationDisplaying?

    init(coordinator: RegistrationCoordinating, dependencies: Dependencies) {
        self.coordinator = coordinator
        self.dependencies = dependencies
    }
}

// MARK: - RegistrationPresenting
extension RegistrationPresenter: RegistrationPresenting {
    func displaySomething() {
        viewController?.displaySomething()
    }
    
    func didNextStep(action: RegistrationAction) {
        coordinator.perform(action: action)
    }
}
