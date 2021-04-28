import Foundation
import HelpInterface
import RouterServiceInterface
import UIKit

public struct HelpRouteHandler: RouteHandler {
    public let routes: [Route.Type] = [HelpRoute.self]

    public init() {}

    public func destination(
        forRoute route: Route,
        fromViewController viewController: UIViewController
    ) -> Feature.Type {
        guard isAnExpected(route: route) else {
            preconditionFailure("unexpected route")
        }
        switch route {
        case _ as HelpRoute:
            return HelpFeature.self
        default:
            preconditionFailure()
        }
    }
}
