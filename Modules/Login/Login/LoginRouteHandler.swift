import Foundation
import LoginInterface
import RouterServiceInterface
import UIKit

public struct LoginRouteHandler: RouteHandler {
    public let routes: [Route.Type] = [LoginRoute.self]

    public init() {}

    public func destination(
        forRoute route: Route,
        fromViewController viewController: UIViewController
    ) -> Feature.Type {
        guard isAnExpected(route: route) else {
            preconditionFailure("unexpected route")
        }
        switch route {
        case _ as LoginRoute:
            return LoginFeature.self
        default:
            preconditionFailure()
        }
    }
}
