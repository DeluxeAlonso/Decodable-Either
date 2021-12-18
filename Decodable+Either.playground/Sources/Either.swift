
public enum Either<L, R> {
    case left(L)
    case right(R)
}

extension Either: Decodable where L: Decodable, R: Decodable {

    public init(from decoder: Decoder) throws {
        if let leftValue = try? L(from: decoder) {
            self = .left(leftValue)
        } else if let rightValue = try? R(from: decoder) {
            self = .right(rightValue)
        } else {
            let context = DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "")
            throw DecodingError.dataCorrupted(context)
        }
    }

}
