//
//  NetworkJSONHandler.swift
//  Albums
//
//  Created by Michael Brünen on 27.11.21.
//

import Foundation

// MARK: - Protocols
protocol NetworkJSONHandlerDataHandler {
    static func data(
        with: Data,
        response: URLResponse
    ) throws -> Data
}

protocol NetworkJSONHandlerJSONSerialization {
    associatedtype JSON

    static func jsonObject(
        with: Data,
        options: JSONSerialization.ReadingOptions
    ) throws -> JSON
}
extension JSONSerialization: NetworkJSONHandlerJSONSerialization {}

// MARK: - NetworkJSONHandler extensions
struct NetworkJSONHandler<
    DataHandler : NetworkJSONHandlerDataHandler,
    JSONSerialization: NetworkJSONHandlerJSONSerialization
> {

}

// MARK: - DataHandler extensions
extension NetworkDataHandler: NetworkJSONHandlerDataHandler {}

// MARK: - Enums, Vars and init
extension NetworkJSONHandler {
    struct Error: Swift.Error {
        enum Code {
            case mimeTypeError
            case dataHandlerError
            case jsonSerializationError
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
}

// MARK: - Functions
extension NetworkJSONHandler {
    static func json(
        with data: Data,
        response: URLResponse
    ) throws -> JSONSerialization.JSON {
        guard let mimeType = response.mimeType?.lowercased(),
              mimeType == "text/javascript"
        else {
            throw Self.Error(.mimeTypeError)
        }

        let data = try { () -> Data in
            do {
                return try DataHandler.data(
                    with: data,
                    response: response
                )
            } catch {
                throw Self.Error(
                    .dataHandlerError,
                    underlying: error
                )
            }
        }()

        do {
            return try JSONSerialization.jsonObject(
                with: data,
                options: []
            )
        } catch {
            throw Self.Error(
                .jsonSerializationError,
                underlying: error
            )
        }
    }
}
