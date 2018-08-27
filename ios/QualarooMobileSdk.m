
#import "QualarooMobileSdk.h"
#import <Qualaroo/Qualaroo.h>

@implementation QualarooMobileSdk

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
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
@end
  
