import HTTPClientInterface
import RouterServiceInterface

public protocol HasNoDependency {}

typealias Dependencies = HasNoDependency & HasHTTPClient

final class DependencyContainer: DependencyContaining, Dependencies {
    lazy var httpClient: HTTPClienting = resolve()

    let dependencies: [Any]

    init(_ dependencies: Any...) {
        self.dependencies = dependencies
    }

    func resolve() -> HTTPClienting {
        resolve(T: HTTPClienting.self)
    }
}
