import Foundation

// swiftlint:disable convenience_type
final class HomeResources {
    static let resourcesBundle: Bundle = {
        guard let url = Bundle(for: HomeResources.self).url(forResource: "HomeResources", withExtension: "bundle") else {
            return Bundle(for: HomeResources.self)
        }
        
        return Bundle(url: url) ?? Bundle(for: HomeResources.self)
    }()
}
