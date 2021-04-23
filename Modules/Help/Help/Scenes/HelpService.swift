import Foundation

protocol HelpServicing {
}

final class HelpService {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - HelpServicing
extension HelpService: HelpServicing {
}
