import Foundation

protocol ProfileServicing {
}

final class ProfileService {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - ProfileServicing
extension ProfileService: ProfileServicing {
}
