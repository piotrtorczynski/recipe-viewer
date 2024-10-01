import Foundation

public final class DefaultDecoder: JSONDecoder {
    public override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
    }
}
