#import <React/RCTBridgeModule.h>

#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE( QualarooMobileSdk, NSObject)

RCT_EXTERN_METHOD(supportedEvents)

RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(init:(NSString *) apiKey
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(showSurvey:(NSString *) surveyAlias
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(setUserId:(NSString *) userId
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(setUserProperty:(NSString *) key withB:(NSString *) value
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(removeUserProperty:(NSString *) key
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(setPreferredLanguage:(NSString *) iso2Language
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end

@interface RCT_EXTERN_MODULE( QualarooEventEmiiter, RCTEventEmitter)

RCT_EXTERN_METHOD(supportedEvents)

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

@end
