import Foundation

protocol SettingsServicing {
}

final class SettingsService {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - SettingsServicing
extension SettingsService: SettingsServicing {
}
