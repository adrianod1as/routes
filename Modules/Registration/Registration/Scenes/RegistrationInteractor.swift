import Foundation
import RouterServiceInterface

protocol RegistrationInteracting: AnyObject {
    func doSomething()
    func getNumberOfItens() -> Int
    func getCell(for index: Int) -> UITableViewCell
    func didSelect(index: Int)
}

final class RegistrationInteractor {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let service: RegistrationServicing
    private let presenter: RegistrationPresenting
    private let menuItems: [Routes] = [.home]

    init(service: RegistrationServicing, presenter: RegistrationPresenting, dependencies: Dependencies) {
        self.service = service
        self.presenter = presenter
        self.dependencies = dependencies
    }
}

// MARK: - RegistrationInteracting
extension RegistrationInteractor: RegistrationInteracting {
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
