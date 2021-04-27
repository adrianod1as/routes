
import Foundation
import RouterServiceInterface

public struct HomeRoute: Route {
    public let username: String

    public init(username: String) {
        self.username = username
    }
}
