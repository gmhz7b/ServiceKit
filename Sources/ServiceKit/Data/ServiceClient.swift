import Foundation
import Combine

import CommonKit

/// An object that performs networking requests based on supplied method parameters.
///
/// - SeeAlso: `ServiceClientProtocol`.
public final class ServiceClient: ServiceClientProtocol {
    
    private let timeout = 60.0
            
    public init() {}
}

extension ServiceClient {
    
    public func publisher(
        for method: RequestMethod,
        to url: URL,
        withBody body: Data?,
        headers: [String: String],
        contentType: ContentType
    ) -> AnyPublisher<Data, Swift.Error> {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.value
        request.timeoutInterval = timeout
        body.map { request.httpBody = $0 }
        request.setValue(contentType.value, forHTTPHeaderField: ContentType.key)
        headers.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        return URLSession(configuration: .default)
            .dataTaskPublisher(for: request)
            .tryMap {
                
                // Ensure the response is in the correct format.
                guard let httpResponse = $0.response as? HTTPURLResponse else {
                    throw Error.invalidResponse
                }

                // Check that the response's status code resides in the "OK" range.
                guard 200 ... 299 ~= httpResponse.statusCode else {
                    throw Error.unsuccsesful(httpResponse.statusCode)
                }

                return $0.data
            }
            .eraseToAnyPublisher()
    }
}

extension ServiceClient {
        
    private enum Error: CustomNSError {
        case invalidResponse
        case unsuccsesful(Int)
        case noData
        
        var errorUserInfo: [String : Any] {
            switch self {
            case .invalidResponse:
                return [NSLocalizedDescriptionKey: LocalizedString.invalidResponse.value]

            case .unsuccsesful(let statusCode):
                return [NSLocalizedDescriptionKey: HTTPURLResponse.localizedString(forStatusCode: statusCode)]

            case .noData:
                return [NSLocalizedDescriptionKey: LocalizedString.noData.value]

            }
        }
    }
    
    private enum LocalizedString: String {
        case invalidResponse = "service-client.invalid-response.error.text"
        case noData = "service-client.no-data.error.text"
                
        var value: String { Bundle.module.localizedString(forKey: rawValue, comment: nil)}
    }
}
