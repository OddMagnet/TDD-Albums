//
//  NetworkImageSourceTests.m
//  AlbumsTests
//
//  Created by Michael Brünen on 26.12.21.
//

#import <XCTest/XCTest.h>

#import "NetworkImageSource.h"

static CGImageSourceRef _Nullable NetworkImageSourceTestDoubleCreateImageSource(CFDataRef _Nonnull, CFDictionaryRef _Nullable) CF_RETURNS_RETAINED;

static id NetworkImageSourceTestDoubleCreateImageSourceParameterData = 0;
static id NetworkImageSourceTestDoubleCreateImageSourceParameterOptions = 0;
static id NetworkImageSourceTestDoubleCreateImageSourceReturnImageSource = 0;

CGImageSourceRef NetworkImageSourceTestDoubleCreateImageSource(CFDataRef data, CFDictionaryRef options) {
    NetworkImageSourceTestDoubleCreateImageSourceParameterData = (__bridge id)data;
    NetworkImageSourceTestDoubleCreateImageSourceParameterOptions = (__bridge id)options;
    return (__bridge_retained CGImageSourceRef)NetworkImageSourceTestDoubleCreateImageSourceReturnImageSource;
}

@interface NetworkImageSourceTestCase : XCTestCase

@end

@implementation NetworkImageSourceTestCase

@end

@implementation NetworkImageSourceTestCase (CreateImageSource)

- (void)testCreateImageSource {
    XCTAssert([NetworkImageSource createImageSource] == CGImageSourceCreateWithData);
}

@end

@implementation NetworkImageSourceTestCase (CreateImage)

- (void)testCreateImage {
    XCTAssert([NetworkImageSource createImage] == CGImageSourceCreateImageAtIndex);
}

@end
