import Foundation

@objc(QualarooEventEmiiter)
open class QualarooEventEmiiter: RCTEventEmitter {
    
    override init() {
        super.init()
        QualarooMobileSdk.sharedInstance.registerEventEmitter(eventEmitter: self)
    }
    
    /// Base overide for RCTEventEmitter.
    ///
    /// - Returns: all supported events
    open override func supportedEvents() -> [String] {
        return ["survey_shown", "survey_dismissed", "survey_finished"]      // etc.
    }

}
