import Foundation
import RouterServiceInterface

protocol HelpInteracting: AnyObject {
    func doSomething()
    func getNumberOfItens() -> Int
    func getCell(for index: Int) -> UITableViewCell
    func didSelect(index: Int)
}

final class HelpInteractor {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let service: HelpServicing
    private let presenter: HelpPresenting
    private let menuItems: [Routes] = []

    init(service: HelpServicing, presenter: HelpPresenting, dependencies: Dependencies) {
        self.service = service
        self.presenter = presenter
        self.dependencies = dependencies
    }
}

// MARK: - HelpInteracting
extension HelpInteractor: HelpInteracting {
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
