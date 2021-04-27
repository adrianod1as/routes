import Foundation
import RouterServiceInterface

protocol HomeInteracting: AnyObject {
    func getTitle()
    func getNumberOfItens() -> Int
    func getCell(for index: Int) -> UITableViewCell
    func didSelect(index: Int)
}

final class HomeInteractor {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let username: String
    private let service: HomeServicing
    private let presenter: HomePresenting
    private let menuItems = Routes.allCases.filter({ $0 != .registration && $0 != .home })

    init(username: String, service: HomeServicing, presenter: HomePresenting, dependencies: Dependencies) {
        self.username = username
        self.service = service
        self.presenter = presenter
        self.dependencies = dependencies
    }
}

// MARK: - HomeInteracting
extension HomeInteractor: HomeInteracting {
    func getTitle() {
        presenter.present(username: username)
    }

    func getNumberOfItens() -> Int {
        menuItems.count
    }

    func getCell(for index: Int) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = menuItems[index].name
        return cell
    }

    func didSelect(index: Int) {
        guard let action = menuItems[index].asHomeAction else { return }
        presenter.didNextStep(action: action)
    }
}

private extension Routes {
    var asHomeAction: HomeAction? {
        switch self {
        case .help:
            return .help
        case .settings:
            return .settings
        case .profile:
            return .profile
        case .login:
            return .login
        default:
            return nil
        }
    }
}
