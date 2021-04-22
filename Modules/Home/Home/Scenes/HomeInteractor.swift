import Foundation
import RouterServiceInterface

protocol HomeInteracting: AnyObject {
    func doSomething()
    func getNumberOfItens() -> Int
    func getCell(for index: Int) -> UITableViewCell
    func didSelect(index: Int)
}

final class HomeInteractor {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let service: HomeServicing
    private let presenter: HomePresenting
    private let menuItems = Routes.allCases.filter({ $0 != .registration && $0 != .home })

    init(service: HomeServicing, presenter: HomePresenting, dependencies: Dependencies) {
        self.service = service
        self.presenter = presenter
        self.dependencies = dependencies
    }
}

// MARK: - HomeInteracting
extension HomeInteractor: HomeInteracting {
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
