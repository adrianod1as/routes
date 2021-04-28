import Foundation
import ProfileInterface
import RouterServiceInterface
import UIKit

public struct ProfileRouteHandler: RouteHandler {
    public let routes: [Route.Type] = [ProfileRoute.self]

    public init() {}

    public func destination(
        forRoute route: Route,
        fromViewController viewController: UIViewController
    ) -> Feature.Type {
        guard isAnExpected(route: route) else {
            preconditionFailure("unexpected route")
        }
        switch route {
        case _ as ProfileRoute:
            return ProfileFeature.self
        default:
            preconditionFailure()
        }
    }
}
