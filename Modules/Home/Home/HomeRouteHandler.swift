import Foundation
import HomeInterface
import RouterServiceInterface
import UIKit

public struct HomeRouteHandler: RouteHandler {
    public let routes: [Route.Type] = [HomeRoute.self]

    public init() {}

    public func destination(
        forRoute route: Route,
        fromViewController viewController: UIViewController
    ) -> Feature.Type {
        guard isAnExpected(route: route) else {
            preconditionFailure("unexpected route")
        }
        switch route {
        case _ as HomeRoute:
            return HomeFeature.self
        default:
            preconditionFailure()
        }
    }
}
