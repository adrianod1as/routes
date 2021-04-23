import Foundation

// swiftlint:disable convenience_type
final class LoginResources {
    static let resourcesBundle: Bundle = {
        guard let url = Bundle(for: LoginResources.self).url(forResource: "LoginResources", withExtension: "bundle") else {
            return Bundle(for: LoginResources.self)
        }
        
        return Bundle(url: url) ?? Bundle(for: LoginResources.self)
    }()
}
