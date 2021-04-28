import Foundation
import SettingsInterface
import RouterServiceInterface
import UIKit

public struct SettingsRouteHandler: RouteHandler {
    public let routes: [Route.Type] = [SettingsRoute.self]

    public init() {}

    public func destination(
        forRoute route: Route,
        fromViewController viewController: UIViewController
    ) -> Feature.Type {
        guard isAnExpected(route: route) else {
            preconditionFailure("unexpected route")
        }
        switch route {
        case _ as SettingsRoute:
            return SettingsFeature.self
        default:
            preconditionFailure()
        }
    }
}
