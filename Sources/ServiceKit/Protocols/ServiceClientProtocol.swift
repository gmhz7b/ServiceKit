import Foundation
import Combine

/// A `protocol` wrapper around an object that performs network requests.
public protocol ServiceClientProtocol {
    
    /// A method that creates and returns a `Combine` `Publisher` for a `URLRequest`.
    ///
    /// - Parameters:
    ///   - method: The HTTP request method of the receiver.
    ///   - url: The URL for the request.
    ///   - body: The data, if any, that is sent as the message body of the request.
    ///   - headers: A `Dictionary` containing the keys and values for HTTP header fields.
    ///   - contentType: A representation header used to indicate the original media type of the resource.
    ///
    ///   - Returns: A `Combine` `Publisher` who's `Success` value contains the data from the `URLResponse`.
    func publisher(
        for method: RequestMethod,
        to url: URL,
        withBody body: Data?,
        headers: [String: String],
        contentType: ContentType
    ) -> AnyPublisher<Data, Swift.Error>
}
