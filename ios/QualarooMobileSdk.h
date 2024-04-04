
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNQualarooMobileSdkSpec.h"

@interface QualarooMobileSdk : NSObject <NativeQualarooMobileSdkSpec>
#else
#import <React/RCTBridgeModule.h>

@interface QualarooMobileSdk : NSObject <RCTBridgeModule>
#endif

@end
