package com.qualaroomobilesdk

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import com.qualaroo.Qualaroo

class QualarooMobileSdkModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  init {
    QualarooMobileSdkModule.reactContext = reactApplicationContext
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android

  @ReactMethod
  fun init(apiKey: String?) {
    Qualaroo.initializeWith(reactApplicationContext)
      .setApiKey(apiKey)
      .init()
  }


  @ReactMethod
  fun setUserId(userId: String?) {
    Qualaroo.getInstance().setUserId(userId!!)
  }

  @ReactMethod
  fun setUserProperty(key: String?, value: String?) {
    Qualaroo.getInstance().setUserProperty(key!!, value)
  }

  @ReactMethod
  fun removeUserProperty(key: String?) {
    Qualaroo.getInstance().removeUserProperty(key!!)
  }

  @ReactMethod
  fun setPreferredLanguage(iso2Language: String?) {
    Qualaroo.getInstance().setPreferredLanguage(iso2Language)
  }


  @ReactMethod
  fun showSurvey(surveyAlias: String){
    Qualaroo.getInstance().showSurvey(surveyAlias)
  }

  @ReactMethod
  fun multiply(a: Double, b: Double, promise: Promise) {
    promise.resolve(a * b)
  }

  companion object {
    const val NAME = "QualarooMobileSdk"
    lateinit var reactContext:ReactApplicationContext
  }
}
