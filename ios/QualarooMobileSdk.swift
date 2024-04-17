import Qualaroo
@objc(QualarooMobileSdk)
class QualarooMobileSdk: NSObject {
    
    public static var sharedInstance = QualarooMobileSdk()
    public static var eventEmitter: QualarooEventEmiiter!
    func registerEventEmitter(eventEmitter: QualarooEventEmiiter) {
         QualarooMobileSdk.eventEmitter = eventEmitter
     }
    
    let delgate = QualarooDeligate()
    @objc(init:withResolver:withRejecter:)
    func `init`(apiKey: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        Qualaroo.shared.configure(with: apiKey)
    }
    
    @objc(showSurvey:withResolver:withRejecter:)
    func showSurvey(surveyAlias: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        Qualaroo.shared.showSurvey(with: surveyAlias,delegate:delgate )
    }

    @objc(setUserId:withResolver:withRejecter:)
    func setUserId(userId: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        Qualaroo.shared.setUserID(userId)
    }
    
    @objc(setUserProperty:withB:withResolver:withRejecter:)
    func setUserProperty(key: String,value: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        Qualaroo.shared.addUserProperty(key, withValue: value)
    }
    
    @objc(removeUserProperty:withResolver:withRejecter:)
    func removeUserProperty(key: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        Qualaroo.shared.removeUserProperty(key)
    }
    
    @objc(setPreferredLanguage:withResolver:withRejecter:)
    func setPreferredLanguage(iso2Language: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        do {
            try Qualaroo.shared.setPreferredSurveysLanguage(iso2Language)
        } catch _ {}
       
    }


  @objc(multiply:withB:withResolver:withRejecter:)
  func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a*b)
  }
}

class QualarooDeligate: SurveyDelegate{

    func surveyDidStart(surveyAlias: String) {
        QualarooMobileSdk.eventEmitter.sendEvent(withName: "survey_shown", body: surveyAlias)
    }
    
    func surveyDidDismiss(surveyAlias: String) {
        QualarooMobileSdk.eventEmitter.sendEvent(withName: "survey_dismissed", body: surveyAlias)
    }
    
    func surveyDidFinish(surveyAlias: String) {
        QualarooMobileSdk.eventEmitter.sendEvent(withName: "survey_finished", body: surveyAlias)
    }

    func surveyDidClose(errorMessage: String) {
        
    }
}
