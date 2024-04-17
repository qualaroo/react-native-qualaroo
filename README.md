
# react-native-qualaroo-mobile-sdk
React Native Bridge for Qualaroo Mobile SDK

## Getting started

### 1. Install package
`$ npm install react-native-qualaroo-mobile-sdk --save`

#### 2. iOS specific
- make sure your `ios/Podfile` contains:
```
target '<YOUR_TARGET_NAME>' do
  ...
  use_frameworks!
  pod 'Qualaroo', :git => 'https://github.com/qualaroo/ios-sdk.git', :tag => '1.14.10'
  ...
end
```
- navigate to **ios** directory and run `pod install`
- make sure **Always Embed Swift Standard Libraries** in your main project's Build Options is set to true

## Usage
```javascript
import QualarooMobileSdk from 'react-native-qualaroo-mobile-sdk';

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

## Observe survey related events
In order to be able to listen to events, you need to add listeners


```java
Step 1:
import {
  NativeModules, NativeEventEmitter, 
  Platform
} from 'react-native';

Step 2:
 const listner = Platform.select({
    ios: new NativeEventEmitter(NativeModules.QualarooEventEmiiter),
    android: DeviceEventEmitter,
  });

Step 3:
 listner?.addListener('survey_shown',(_surveyAlias:string) =>{
     //survey has just been shown to a user
    })
    listner?.addListener('survey_dismissed',(_surveyAlias:string) =>{
//survey has been dismissed by a user
    })
    listner?.addListener('survey_finished',(_surveyAlias:string) =>{
//user has completed the survey by answering all of the questions
    })

```

#### Example
```java
import * as React from 'react';

import {
  Button,
  DeviceEventEmitter,
  StyleSheet,
  View,
  NativeModules, NativeEventEmitter, 
  Platform
} from 'react-native';
import QualarooMobileSdk from 'react-native-qualaroo-mobile-sdk';


export default function App() {
 const listner = Platform.select({
    ios: new NativeEventEmitter(NativeModules.QualarooEventEmiiter),
    android: DeviceEventEmitter,
  });
  React.useEffect(() => {
    QualarooMobileSdk.init('<your_key_here>');
  
    listner?.addListener('survey_shown',(_surveyAlias:string) =>{
    })
    listner?.addListener('survey_dismissed',(_surveyAlias:string) =>{
    })
    listner?.addListener('survey_finished',(_surveyAlias:string) =>{
    })
  }, []);

  return (
    <View style={styles.container}>
      <Button
        title={'show'}
        onPress={() => {
          QualarooMobileSdk.showSurvey("<your_survey_alias>")
        }}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});

```
#### For Android Specific
Add Reciever in your AndroidManifest.xml file
```java
  <receiver
        android:name="com.qualaroomobilesdk.QualarooMobileSdkEventReceiver"
        android:exported="false">
        <intent-filter>
          <action android:name="com.qualaroo.event.ACTION_SURVEY_EVENT"/>
        </intent-filter>
  </receiver>
```