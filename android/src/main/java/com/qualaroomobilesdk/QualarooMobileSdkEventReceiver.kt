package com.qualaroomobilesdk

import android.content.Context
import android.content.Intent
import com.facebook.react.bridge.ReactContext
import com.facebook.react.modules.core.DeviceEventManagerModule
import com.qualaroo.QualarooSurveyEventReceiver

class QualarooMobileSdkEventReceiver : QualarooSurveyEventReceiver() {
  override fun onReceive(context: Context?, intent: Intent?) {
    super.onReceive(context, intent)
  }
  override fun onSurveyEvent(surveyAlias: String, eventType: Int) {
    when (eventType) {
      EVENT_TYPE_SHOWN -> {
        sendEvent(QualarooMobileSdkModule.reactContext,"survey_shown", surveyAlias);
      }
      EVENT_TYPE_DISMISSED -> {
        sendEvent(QualarooMobileSdkModule.reactContext,"survey_dismissed", surveyAlias);
      }
      EVENT_TYPE_FINISHED ->{
        sendEvent(QualarooMobileSdkModule.reactContext,"survey_finished", surveyAlias);
      }
    }
  }

  private fun sendEvent(reactContext: ReactContext, eventName: String, surveyAlias: String) {
    reactContext
      .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter::class.java)
      .emit(eventName, surveyAlias)
  }
}
