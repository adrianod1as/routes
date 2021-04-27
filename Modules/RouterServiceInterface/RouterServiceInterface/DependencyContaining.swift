public protocol DependencyContaining {
    var dependencies: [Any] { get }
}

public extension DependencyContaining {
    func resolve<T>(T: T.Type) -> T {
        let resolved = dependencies.compactMap { $0 as? T }

        switch resolved.first {
        case .none:
            fatalError("DependencyContainer could not resolve dependency: \(T.self)\n")
        case .some where resolved.count > 1:
            fatalError("DependencyContainer resolved mutiple dependencies for: \(T.self)\n")
        case .some(let object):
            return object
        }
    }

    func resolve<T>() -> T {
        resolve(T: T.self)
    }
}
