import UIKit

public protocol RouteHandler {
    var routes: [Route.Type] { get }

    func destination(
        forRoute route: Route,
        fromViewController viewController: UIViewController
    ) -> Feature.Type
}

public extension RouteHandler {
    func isAnExpected(route: Route) -> Bool {
        routes.contains(where: { $0 == type(of: route)} )
    }
}
