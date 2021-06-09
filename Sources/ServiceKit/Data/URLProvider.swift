import Foundation

/// An object that provides convenience methods for creating `URL`s.
///
/// - SeeAlso: `URLProviderProtocol`.
public final class URLProvider: URLProviderProtocol {
    
    public init() {}
}

extension URLProvider {
    
    public func url(for baseURL: URL, pathComponents: [String], parameters: [String: String]) -> URL {
        let baseUrlWithPathComponents = url(for: baseURL, pathComponents: pathComponents)
        
        guard !parameters.isEmpty else {
            return baseUrlWithPathComponents
        }
        
        return url(for: baseUrlWithPathComponents, parameters: parameters) ?? baseUrlWithPathComponents
    }

    public func url(for url: URL, parameters: [String: String]) -> URL? {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        return urlComponents?.url
    }

    public func url(for url: URL, pathComponents: [String]) -> URL {
        
        return pathComponents.reduce(url) { $0.appendingPathComponent($1) }
    }
    
    public func percentEncoded(url: URL) -> String? {
        
        return url
            .absoluteString
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}
