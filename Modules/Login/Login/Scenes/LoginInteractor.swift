import Foundation
import RouterServiceInterface

protocol LoginInteracting: AnyObject {
    func doSomething()
    func getNumberOfItens() -> Int
    func getCell(for index: Int) -> UITableViewCell
    func didSelect(index: Int)
}

final class LoginInteractor {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let service: LoginServicing
    private let presenter: LoginPresenting
    private let menuItems: [Routes] = [.home, .registration]

    init(service: LoginServicing, presenter: LoginPresenting, dependencies: Dependencies) {
        self.service = service
        self.presenter = presenter
        self.dependencies = dependencies
    }
}

// MARK: - LoginInteracting
extension LoginInteractor: LoginInteracting {
    func doSomething() {
        presenter.displaySomething()
    }

    func getNumberOfItens() -> Int {
        menuItems.count
    }

    func getCell(for index: Int) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = menuItems[index].name
        return cell
    }

    func didSelect(index: Int) {}
}
