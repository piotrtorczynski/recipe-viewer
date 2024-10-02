import Combine
import Foundation

public protocol APIClient {
    
    /// Performs specific request
    ///
    /// - Parameters:
    ///   - request: APIRequest which needs to be performed
    ///   - returns: Publisher with response or
    func perform<T: APIRequest>(request: T, _ decoder: JSONDecoder) async throws -> T.ReturnType
}

public extension APIClient {
    func perform<T: APIRequest>(request: T, _ decoder: JSONDecoder = .init(keyDecodingStrategy: .convertFromSnakeCase)) async throws -> T.ReturnType {
        return try await perform(request: request, decoder)
    }
}
