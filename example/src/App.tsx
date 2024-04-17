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
 const listener = Platform.select({
    ios: new NativeEventEmitter(NativeModules.QualarooEventEmiiter),
    android: DeviceEventEmitter,
  });
  React.useEffect(() => {
    QualarooMobileSdk.init('<your_key_here>');
   
    listener?.addListener('survey_shown',(_surveyAlias:string) =>{
    })
    listener?.addListener('survey_dismissed',(_surveyAlias:string) =>{
    })
    listener?.addListener('survey_finished',(_surveyAlias:string) =>{
    })
  }, []);

  return (
    <View style={styles.container}>
      <Button
        title={'show'}
        onPress={() => {
          QualarooMobileSdk.showSurvey('<your_survey_alias>')
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
