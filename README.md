
# react-native-qualaroo-mobile-sdk
React Native Bridge for Qualaroo Mobile SDK

## Getting started

### 1. Install package
`$ npm install react-native-qualaroo-mobile-sdk --save`

#### 2a. Android specific
- include the following in your `android/app/build.gradle` file:
```
repositories {
    maven {
        url 'https://s3.amazonaws.com/qualaroo-android-sdk/libs'
    }
}
dependencies {
    compile 'com.qualaroo:qualaroo-sdk:1.8.4'
}
```

#### 2b. iOS specific
- make sure your `ios/Podfile` contains:
```
target '<YOUR_TARGET_NAME>' do
  ...
  use_frameworks!
  pod 'Qualaroo'
  ...
end
```
- navigate to **ios** directory and run `pod install`
- make sure **Always Embed Swift Standard Libraries** in your main project's Build Options is set to true


### 3. Link package
`$ react-native link react-native-qualaroo-mobile-sdk`

## Usage
```javascript
import QualarooMobileSdk from 'react-native-mobile-sdk';

//In order to be able to use Qualaroo SDK you need to to initialize it first.
QualarooMobileSdk.init("<your_api_key">)

//Display survey with a given alias:
QualarooMobileSdk.showSurvey("survey_alias")

//Set unique user id
QualarooMobileSdk.setUserId("HAL_9000");

//Set user property "name" to "Hal"
QualarooMobileSdk.setUserProperty("name", "Hal");

//remove property "name"
QualarooMobileSdk.removeUserProperty("name");

//You can set preferred language that you want to use when displaying surveys.
QualarooMobileSdk.setPreferredLanguage("fr")

```
