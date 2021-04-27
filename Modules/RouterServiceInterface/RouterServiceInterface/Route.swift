import Foundation

public protocol Route: Decodable {
    static var identifier: String { get }
}

public extension Route {
    static var identifier: String {
        String(describing: Self.self)
    }
}
