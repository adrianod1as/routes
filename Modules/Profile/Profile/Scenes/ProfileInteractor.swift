import Foundation
import RouterServiceInterface

protocol ProfileInteracting: AnyObject {
    func doSomething()
    func getNumberOfItens() -> Int
    func getCell(for index: Int) -> UITableViewCell
    func didSelect(index: Int)
}

final class ProfileInteractor {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let service: ProfileServicing
    private let presenter: ProfilePresenting
    private let menuItems: [Routes] = []

    init(service: ProfileServicing, presenter: ProfilePresenting, dependencies: Dependencies) {
        self.service = service
        self.presenter = presenter
        self.dependencies = dependencies
    }
}

// MARK: - ProfileInteracting
extension ProfileInteractor: ProfileInteracting {
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
