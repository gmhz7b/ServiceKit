import Foundation

/// An `protocol` describing an object that provides convenience methods for creating `URL`s.
public protocol URLProviderProtocol {
    
    /// Creates a `URL` with the given parameters.
    ///
    /// - Parameters:
    ///   - baseURL: The root `URL`.
    ///   - pathComponents: A `[String]` of path components that will be added to the `baseURL`.
    ///   - parameters: A `Dictionary` of query parameters that will be added to the `baseURL`.
    ///
    /// - Returns: A `URL` that combines the `baseURL` with the supplied `pathComponents` and query `parameters`.
    func url(for baseURL: URL, pathComponents: [String], parameters: [String: String]) -> URL
    
    /// Creates a `URL` with the given parameters.
    ///
    /// - Parameters:
    ///   - baseURL: The root `URL`.
    ///   - parameters: A `Dictionary` of query parameters that will be added to the `baseURL`.
    ///
    /// - Returns: A `URL` that combines the `baseURL` with the supplied query `parameters`.
    func url(for url: URL, parameters: [String: String]) -> URL?
    
    /// Creates a `URL` with the given parameters.
    ///
    /// - Parameters:
    ///   - baseURL: The root `URL`.
    ///   - pathComponents: A `[String]` of path components that will be added to the `baseURL`.
    ///
    /// - Returns: A `URL` that combines the `baseURL` with the supplied `pathComponents`..
    func url(for url: URL, pathComponents: [String]) -> URL
    
    /// Percent-encodes a given `URL`.
    func percentEncoded(url: URL) -> String?
}
