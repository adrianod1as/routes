import Foundation

// swiftlint:disable convenience_type
final class RegistrationResources {
    static let resourcesBundle: Bundle = {
        guard let url = Bundle(for: RegistrationResources.self).url(forResource: "RegistrationResources", withExtension: "bundle") else {
            return Bundle(for: RegistrationResources.self)
        }
        
        return Bundle(url: url) ?? Bundle(for: RegistrationResources.self)
    }()
}
