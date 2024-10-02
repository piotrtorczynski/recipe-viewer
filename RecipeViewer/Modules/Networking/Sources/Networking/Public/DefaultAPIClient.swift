import Foundation

public final class DefaultAPIClient: APIClient {
    // MARK: Properties

    private var session: URLSession

    // MARK: Initializers

    public init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: APIClient

    public func perform<T: APIRequest>(request: T, _ decoder: JSONDecoder = .init(keyDecodingStrategy: .convertFromSnakeCase)) async throws -> T.ReturnType {
        try await send(request: request, decoder)
    }

    // MARK: Private

    private func send<T: APIRequest>(request: T, _ decoder: JSONDecoder) async throws -> T.ReturnType {
        var urlRequest: URLRequest
        if request.requiresAuthorization {
            let configuartion = URLSessionConfiguration.default
            configuartion.httpAdditionalHeaders = request.headers
            session = URLSession(configuration: configuartion)
        }
        do {
            urlRequest = try URLRequest(request: request)
            urlRequest.cachePolicy = .reloadRevalidatingCacheData
        } catch let error {
            #if DEBUG
            print(error)
            #endif
            throw error
        }

        do {
            let (data, _) = try await session.data(for: urlRequest)
            return try decoder.decode(T.ReturnType.self, from: data)
        } catch {
            if (error as NSError).code == NSURLErrorNotConnectedToInternet {
                throw APIError.internetConnectionUnavailable
            } else {
            #if DEBUG
                print(error)
            #endif
                throw error
            }
        }
    }
}
