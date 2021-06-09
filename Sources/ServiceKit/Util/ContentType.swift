import Foundation

/// A convenience `enum` representing the header used to indicate the original media type of a web resource.
public enum ContentType: String {
    case urlEncoded = "application/x-www-form-urlencoded"
    case json = "application/json"
}

extension ContentType {
    
    static let key = "Content-Type"
    
    var value: String { rawValue }
}
