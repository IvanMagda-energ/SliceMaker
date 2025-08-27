//
//  Logger.swift
//  SliceMaker
//
//  Created by Ivan Magda on 27.08.2025.
//

import OSLog

/// Categories for structured logging.
enum LogCategory: String {
    case info = "Info"
    case error = "Error"
    case warning = "Warning"
    case debug = "Debug"
}

/// A service for unified logging using `os.Logger`.
/// Provides category-specific loggers with emoji markers for better readability.
final class LoggerService {
    // MARK: - Properties
    
    private static let subsystem = Bundle.main.bundleIdentifier ?? "ivanmagda.SliceMaker"
    private static let infoLogger = Logger(subsystem: subsystem, category: LogCategory.info.rawValue)
    private static let errorLogger = Logger(subsystem: subsystem, category: LogCategory.error.rawValue)
    private static let warningLogger = Logger(subsystem: subsystem, category: LogCategory.warning.rawValue)
    private static let debugLogger = Logger(subsystem: subsystem, category: LogCategory.debug.rawValue)
    
    // MARK: - Logging
    
    /// Logs entering into a function or scope.
    /// - Parameters:
    ///   - file: Source file path (auto-filled by default).
    ///   - function: Function name (auto-filled by default).
    static func entering(file: String = #file, function: String = #function) {
        let fileName = (file as NSString).lastPathComponent
        debugLogger.debug("🚪 Enter [\(fileName, privacy: .public)] \(function, privacy: .public)")
    }
    
    /// Logs informational message.
    /// - Parameters:
    ///   - message: Message to log.
    ///   - file: Source file path (auto-filled by default).
    ///   - function: Function name (auto-filled by default).
    static func info(_ message: String = "", file: String = #file, function: String = #function) {
        let fileName = (file as NSString).lastPathComponent
        infoLogger.info("ℹ️ [\(fileName, privacy: .public)] \(function, privacy: .public): \(message, privacy: .public)")
    }
    
    /// Logs error message.
    /// - Parameters:
    ///   - message: Error description to log.
    ///   - file: Source file path (auto-filled by default).
    ///   - function: Function name (auto-filled by default).
    static func error(_ message: String = "", file: String = #file, function: String = #function) {
        let fileName = (file as NSString).lastPathComponent
        errorLogger.error("❌ [\(fileName, privacy: .public)] \(function, privacy: .public): \(message, privacy: .public)")
    }
    
    /// Logs warning message.
    /// - Parameters:
    ///   - message: Warning description to log.
    ///   - file: Source file path (auto-filled by default).
    ///   - function: Function name (auto-filled by default).
    static func warning(_ message: String = "", file: String = #file, function: String = #function) {
        let fileName = (file as NSString).lastPathComponent
        warningLogger.warning("⚠️ [\(fileName, privacy: .public)] \(function, privacy: .public): \(message, privacy: .public)")
    }
    
    /// Logs debug message.
    /// - Parameters:
    ///   - message: Debug information to log.
    ///   - file: Source file path (auto-filled by default).
    ///   - function: Function name (auto-filled by default).
    static func debug(_ message: String = "", file: String = #file, function: String = #function) {
        let fileName = (file as NSString).lastPathComponent
        debugLogger.debug("🐞 [\(fileName, privacy: .public)] \(function, privacy: .public): \(message, privacy: .public)")
    }
}
