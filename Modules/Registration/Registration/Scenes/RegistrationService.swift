import Foundation

protocol RegistrationServicing {
}

final class RegistrationService {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - RegistrationServicing
extension RegistrationService: RegistrationServicing {
}
