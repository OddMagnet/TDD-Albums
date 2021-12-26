//
//  NetworkImageSourceTests.m
//  AlbumsTests
//
//  Created by Michael Brünen on 26.12.21.
//

#import <XCTest/XCTest.h>

#import "NetworkImageSource.h"

@interface NetworkImageSourceTestCase : XCTestCase

@end

@implementation NetworkImageSourceTestCase

@end

@implementation NetworkImageSourceTestCase (CreateImageSource)

- (void)testCreateImageSource {
    XCTAssert([NetworkImageSource createImageSource] == CGImageSourceCreateWithData);
}

@end
