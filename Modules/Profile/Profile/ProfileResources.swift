import Foundation

// swiftlint:disable convenience_type
final class ProfileResources {
    static let resourcesBundle: Bundle = {
        guard let url = Bundle(for: ProfileResources.self).url(forResource: "ProfileResources", withExtension: "bundle") else {
            return Bundle(for: ProfileResources.self)
        }
        
        return Bundle(url: url) ?? Bundle(for: ProfileResources.self)
    }()
}
