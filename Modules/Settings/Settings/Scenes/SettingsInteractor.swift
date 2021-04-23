import Foundation
import RouterServiceInterface

protocol SettingsInteracting: AnyObject {
    func doSomething()
    func getNumberOfItens() -> Int
    func getCell(for index: Int) -> UITableViewCell
    func didSelect(index: Int)
}

final class SettingsInteractor {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let service: SettingsServicing
    private let presenter: SettingsPresenting
    private let menuItems: [Routes] = [.profile, .help, .login]

    init(service: SettingsServicing, presenter: SettingsPresenting, dependencies: Dependencies) {
        self.service = service
        self.presenter = presenter
        self.dependencies = dependencies
    }
}

// MARK: - SettingsInteracting
extension SettingsInteractor: SettingsInteracting {
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
