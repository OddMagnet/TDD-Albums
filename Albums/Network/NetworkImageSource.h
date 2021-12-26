//
//  NetworkImageSource.h
//  Albums
//
//  Created by Michael Brünen on 26.12.21.
//

#import <Foundation/Foundation.h>
#import <ImageIO/ImageIO.h>

@interface NetworkImageSource : NSObject

@end

@interface NetworkImageSource (CreateImageSource)

+ (CGImageSourceRef _Nullable (*_Nonnull)(CFDataRef _Nonnull, CFDictionaryRef _Nullable))createImageSource;

@end
