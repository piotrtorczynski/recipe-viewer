import Foundation

extension JSONDecoder {
    public convenience init(keyDecodingStrategy: KeyDecodingStrategy) {
        self.init()
        self.keyDecodingStrategy = keyDecodingStrategy
    }
}
