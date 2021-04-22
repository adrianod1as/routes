public enum Routes: String, CaseIterable {
    case home
    case settings
    case profile
    case help
    case login
    case registration

    public var name: String {
        self.rawValue.capitalized
    }
}
