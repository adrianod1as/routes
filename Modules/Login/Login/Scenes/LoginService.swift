import Foundation
import HTTPClientInterface

protocol LoginServicing {
}

final class LoginService {
    typealias Dependencies = HasHTTPClient
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - LoginServicing
extension LoginService: LoginServicing {
}
