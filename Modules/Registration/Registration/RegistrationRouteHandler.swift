import Foundation
import RegistrationInterface
import RouterServiceInterface
import UIKit

public struct RegistrationRouteHandler: RouteHandler {
    public let routes: [Route.Type] = [RegistrationRoute.self]

    public init() {}

    public func destination(
        forRoute route: Route,
        fromViewController viewController: UIViewController
    ) -> Feature.Type {
        guard isAnExpected(route: route) else {
            preconditionFailure("unexpected route")
        }
        switch route {
        case _ as RegistrationRoute:
            return RegistrationFeature.self
        default:
            preconditionFailure()
        }
    }
}
