import React from 'react';
import { Button, StyleSheet, Text, View } from 'react-native';
import QualarooMobileSdk from 'react-native-qualaroo-mobile-sdk';

export default class App extends React.Component {

  constructor(props) {
    super(props);
    QualarooMobileSdk.init("MzkyNDE6NzUyYmQ5OGVjMjEyMTYzMDNhOTJmYjllMGYyZjMyNWY3ZTZhNDU1Yjo2NDgzMg==");
  }
  _onButtonPress() {  
    QualarooMobileSdk.showSurvey("sample_nps");
  }
  render() {
    return (
      <View style={styles.container}>
        <Text>Run Qualaroo surveys in your React Native app!</Text>
        <View style={styles.button}>
          <Button 
            title="Show survey!"
            onPress={this._onButtonPress}/>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  button: {
    margin: 16
  }
});
