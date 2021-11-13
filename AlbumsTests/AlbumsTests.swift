//
//  AlbumsTests.swift
//  AlbumsTests
//
//  Created by Michael Brünen on 13.11.21.
//

import XCTest
@testable import Albums

class AlbumsTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

// MARK: - Network Helper functions
func DataTestDouble() -> Data {
    return Data(UInt8.min...UInt8.max)
}

func URLTestDouble() -> URL {
    URL(string: "http://localhost/")!
}

func URLRequestTestDouble() -> URLRequest {
    return URLRequest(url: URLTestDouble())
}

func URLResponseTestDouble() -> URLResponse {
    return URLResponse(
        url: URLTestDouble(),
        mimeType: nil,
        expectedContentLength: 0,
        textEncodingName: nil
    )
}

func HTTPURLResponseTestDouble(
    statusCode: Int = 200,
    headerFields: Dictionary<String, String>? = nil
) -> HTTPURLResponse {
    return HTTPURLResponse(
        url: URLTestDouble(),
        statusCode: statusCode,
        httpVersion: "HTTP/1.1",
        headerFields: headerFields
    )!
}

func NSErrorTestDouble() -> NSError {
    return NSError(
        domain: "",
        code: 0
    )
}
