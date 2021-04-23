import Foundation

protocol HomeServicing {
}

final class HomeService {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - HomeServicing
extension HomeService: HomeServicing {
}
