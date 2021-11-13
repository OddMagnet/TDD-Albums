//
//  NetworkDataHandler.swift
//  Albums
//
//  Created by Michael Brünen on 13.11.21.
//

import Foundation

struct NetworkDataHandler {

}

extension NetworkDataHandler {
    struct Error: Swift.Error {
        enum Code {
            case statusCodeError
        }

        let code: Self.Code
        let underlying: Swift.Error?

        init(
            _ code: Self.Code,
            underlying: Swift.Error? = nil
        ) {
            self.code = code
            self.underlying = underlying
        }
    }

    static func data(
        with data: Data,
        response: URLResponse
    ) throws -> Data {
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
              200...299 ~= statusCode
        else {
            throw self.Error(.statusCodeError)
        }

        return data
    }
}
