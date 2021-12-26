//
//  NetworkImageSourceTests.m
//  AlbumsTests
//
//  Created by Michael Brünen on 26.12.21.
//

#import <XCTest/XCTest.h>

#import "NetworkImageSource.h"

// MARK: - Test-doubles
static CGImageSourceRef _Nullable NetworkImageSourceTestDoubleCreateImageSource(CFDataRef _Nonnull, CFDictionaryRef _Nullable) CF_RETURNS_RETAINED;

static id NetworkImageSourceTestDoubleCreateImageSourceParameterData = 0;
static id NetworkImageSourceTestDoubleCreateImageSourceParameterOptions = 0;
static id NetworkImageSourceTestDoubleCreateImageSourceReturnImageSource = 0;

CGImageSourceRef NetworkImageSourceTestDoubleCreateImageSource(CFDataRef data, CFDictionaryRef options) {
    NetworkImageSourceTestDoubleCreateImageSourceParameterData = (__bridge id)data;
    NetworkImageSourceTestDoubleCreateImageSourceParameterOptions = (__bridge id)options;
    return (__bridge_retained CGImageSourceRef)NetworkImageSourceTestDoubleCreateImageSourceReturnImageSource;
}

@interface NetworkImageSourceTestDouble : NetworkImageSource

@end

@implementation NetworkImageSourceTestDouble

@end

@implementation NetworkImageSourceTestDouble (CreateImageSource)

+ (CGImageSourceRef _Nullable (*_Nonnull)(CFDataRef _Nonnull, CFDictionaryRef _Nullable))createImageSource {
    return NetworkImageSourceTestDoubleCreateImageSource;
}

@end



// MARK: (normal) Test cases
@interface NetworkImageSourceTestCase : XCTestCase

@end

@implementation NetworkImageSourceTestCase

@end

@implementation NetworkImageSourceTestCase (TearDown)

- (void)tearDown {
    NetworkImageSourceTestDoubleCreateImageSourceParameterData = 0;
    NetworkImageSourceTestDoubleCreateImageSourceParameterOptions = 0;
    NetworkImageSourceTestDoubleCreateImageSourceReturnImageSource = 0;
}

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



//MARK: (test-double) Test cases
@implementation NetworkImageSourceTestCase (CreateImageSourceTestDouble)

- (void)testCreateImageSourceTestDouble {
    NetworkImageSourceTestDoubleCreateImageSourceReturnImageSource = [[NSObject alloc] init];

    id data = [[NSObject alloc] init];
    id options = [[NSObject alloc] init];

    id imageSource = (__bridge_transfer id)[NetworkImageSourceTestDouble createImageSourceWithData:(__bridge CFDataRef)data
                                                                                           options:(__bridge CFDictionaryRef)options];

    XCTAssert(NetworkImageSourceTestDoubleCreateImageSourceParameterData == data);
    XCTAssert(NetworkImageSourceTestDoubleCreateImageSourceParameterOptions == options);

    XCTAssert(imageSource == NetworkImageSourceTestDoubleCreateImageSourceReturnImageSource);
}

@end
