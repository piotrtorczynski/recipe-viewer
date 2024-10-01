import Foundation

/// Defines request's method
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case options = "OPTIONS"
}

public protocol APIRequest {
    /// Return Type
    associatedtype ReturnType: Codable
    
    /// HTTP method
    var method: HTTPMethod { get }
    
    /// Path to resource
    var path: String { get }
    
    /// HTTP method
    var urlBuilder: APIURLBuilder { get }

    var headers: [String: String] { get }

    /// Queries
    var query: [URLQueryItem]? { get }

    var requiresAuthorization: Bool { get }

}

// MARK: - Default values for API request
public extension APIRequest {
    
    var method: HTTPMethod { return .get }
    
    var query: [URLQueryItem]? { return nil }

    var headers: [String: String] { return [:] }

    var requiresAuthorization: Bool { return false }
}
