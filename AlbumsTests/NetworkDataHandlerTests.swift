//
//  NetworkDataHandlerTests.swift
//  AlbumsTests
//
//  Created by Michael Brünen on 13.11.21.
//

import XCTest

final class NetworkDataHandlerTestCase: XCTestCase {

}

extension NetworkDataHandlerTestCase {
    func testError() {
        XCTAssertThrowsError(
            try NetworkDataHandler.data(
                with: DataTestDouble(),
                response: URLResponseTestDouble()
            )
        )
    }
}
