import Foundation

// swiftlint:disable convenience_type
final class HelpResources {
    static let resourcesBundle: Bundle = {
        guard let url = Bundle(for: HelpResources.self).url(forResource: "HelpResources", withExtension: "bundle") else {
            return Bundle(for: HelpResources.self)
        }
        
        return Bundle(url: url) ?? Bundle(for: HelpResources.self)
    }()
}
