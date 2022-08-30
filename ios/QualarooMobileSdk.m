#import "QualarooMobileSdk.h"

#ifdef RCT_NEW_ARCH_ENABLED
#import "RNQualarooMobileSdkSpec.h"
#endif
@import Qualaroo;
@implementation QualarooMobileSdk
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(init:(NSString *) apiKey) {
    [Qualaroo.shared configureWith:apiKey];
}

RCT_EXPORT_METHOD(showSurvey:(NSString *) surveyAlias) {
    [Qualaroo.shared showSurveyWith:surveyAlias on:nil forced:false delegate:nil];
}

RCT_EXPORT_METHOD(setUserId:(NSString *) userId) {
  [Qualaroo.shared setUserID:userId];
}

RCT_EXPORT_METHOD(setUserProperty:(NSString * _Nonnull)key withValue:(NSString * _Nonnull)value) {
  [Qualaroo.shared addUserProperty:key withValue:value];
}

RCT_EXPORT_METHOD(removeUserProperty:(NSString *) key) {
  [Qualaroo.shared removeUserProperty:key];
}

RCT_EXPORT_METHOD(setPreferredLanguage:(NSString *) iso2Language) {
  [Qualaroo.shared setPreferredSurveysLanguage:iso2Language error:nil];
}

// Example method
// See // https://reactnative.dev/docs/native-modules-ios
RCT_REMAP_METHOD(multiply,
                 multiplyWithA:(double)a withB:(double)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
  NSNumber *result = @(a * b);

  resolve(result);
}

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeQualarooMobileSdkSpecJSI>(params);
}
#endif

@end
