import Foundation

// swiftlint:disable convenience_type
final class SettingsResources {
    static let resourcesBundle: Bundle = {
        guard let url = Bundle(for: SettingsResources.self).url(forResource: "SettingsResources", withExtension: "bundle") else {
            return Bundle(for: SettingsResources.self)
        }
        
        return Bundle(url: url) ?? Bundle(for: SettingsResources.self)
    }()
}
