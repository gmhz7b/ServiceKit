import Foundation

/// A convenience `enum` representing the HTTP request method of a receiver.
public enum RequestMethod: String {
    case get
    case post    
}

extension RequestMethod {
    
    var value: String { rawValue.uppercased() }
}
