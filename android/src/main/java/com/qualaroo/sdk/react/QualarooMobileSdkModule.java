
package com.qualaroo.sdk.react;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.qualaroo.Qualaroo;

public class QualarooMobileSdkModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public QualarooMobileSdkModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "QualarooMobileSdk";
  }

  @ReactMethod
  public void init(String apiKey) {
    Qualaroo.initializeWith(reactContext)
            .setApiKey(apiKey)
            .init();
  }

  @ReactMethod
  public void showSurvey(String surveyAlias) {
    Qualaroo.getInstance().showSurvey(surveyAlias);
  }

  @ReactMethod
  public void setUserId(String userId) {
    Qualaroo.getInstance().setUserId(userId);
  }

  @ReactMethod
  public void setUserProperty(String key, String value) {
    Qualaroo.getInstance().setUserProperty(key, value);
  }

  @ReactMethod
  public void removeUserProperty(String key) {
    Qualaroo.getInstance().removeUserProperty(key);
  }

  @ReactMethod
  public void setPreferredLanguage(String iso2Language) {
    Qualaroo.getInstance().setPreferredLanguage(iso2Language);
  }

}
