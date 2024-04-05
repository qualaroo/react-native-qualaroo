import * as React from 'react';

import {
  Button,
  DeviceEventEmitter,
  StyleSheet,
  ToastAndroid,
  View,
} from 'react-native';
import QualarooMobileSdk from 'react-native-qualaroo-mobile-sdk';

export default function App() {
  React.useEffect(() => {
    QualarooMobileSdk.init(
      'NzQ4MTQ6YTJkMzA3OTY4MWNjMWVmYWYzM2VjMDM0ZWY4Nzg2YzBlN2ExMjI2ZDo3MjEzMg=='
    );
    DeviceEventEmitter.addListener('survey_shown', (_data) => {
      console.log('survey_show');
      ToastAndroid.show(_data, ToastAndroid.SHORT);
    });
    DeviceEventEmitter.addListener('survey_dismissed', (_data) => {
      ToastAndroid.show(_data, ToastAndroid.SHORT);
    });
    DeviceEventEmitter.addListener('survey_finished', (_data) => {
      ToastAndroid.show(_data, ToastAndroid.SHORT);
    });
  }, []);

  return (
    <View style={styles.container}>
      <Button
        title={'press'}
        onPress={() => {
          QualarooMobileSdk.showSurvey('nps__net_promoter_score1234');
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
