// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// NIBM COVID19
  internal static let appName = L10n.tr("Localizable", "app_name")
  /// Can attend college
  internal static let canAttendCollege = L10n.tr("Localizable", "can_attend_college")
  /// Current stats
  internal static let currentStatsHeading = L10n.tr("Localizable", "current_stats_heading")
  /// DEATHS
  internal static let deaths = L10n.tr("Localizable", "deaths")
  /// Email
  internal static let enterEmailPlaceholder = L10n.tr("Localizable", "enter_email_placeholder")
  /// Password
  internal static let enterPasswordPlaceholder = L10n.tr("Localizable", "enter_password_placeholder")
  /// Welcome to
  internal static let headingOutline = L10n.tr("Localizable", "heading_outline")
  /// INFECTED
  internal static let infected = L10n.tr("Localizable", "infected")
  /// L O G I N
  internal static let login = L10n.tr("Localizable", "login")
  /// More
  internal static let moreFeaturesHeading = L10n.tr("Localizable", "more_features_heading")
  /// News
  internal static let news = L10n.tr("Localizable", "news")
  /// OK
  internal static let ok = L10n.tr("Localizable", "ok")
  /// Re-enter password
  internal static let reenterPasswordPlaceholder = L10n.tr("Localizable", "reenter_password_placeholder")
  /// S I G N  U P
  internal static let signUp = L10n.tr("Localizable", "sign_up")
  /// Sign Up
  internal static let signUpPageTitle = L10n.tr("Localizable", "sign_up_page_title")
  /// Stay at home
  internal static let stayAtHome = L10n.tr("Localizable", "stay_at_home")
  /// SUSPECTS
  internal static let suspects = L10n.tr("Localizable", "suspects")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
