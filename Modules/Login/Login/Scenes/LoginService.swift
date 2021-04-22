import Foundation

protocol LoginServicing {
}

final class LoginService {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - LoginServicing
extension LoginService: LoginServicing {
}
