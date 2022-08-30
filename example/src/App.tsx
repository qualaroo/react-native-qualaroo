/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

 import React, { useEffect } from 'react';
 import {
   SafeAreaView,
   StatusBar,
   Button
 } from 'react-native';
 
 import QualarooMobileSdk from 'react-native-qualaroo-mobile-sdk';



const App = () => {
  useEffect(()=>{
    QualarooMobileSdk.init("NzQ4MTQ6YTJkMzA3OTY4MWNjMWVmYWYzM2VjMDM0ZWY4Nzg2YzBlN2ExMjI2ZDo3Nzc3Mw==")
   },[])

  return (
    <>
       <StatusBar barStyle="dark-content" />
       <SafeAreaView>
         <Button
         title={"press"}
         onPress = {()=>{
          // QualarooMobileSdk.setUserProperty("screen_name","home")
          QualarooMobileSdk.showSurvey("test_font_style")
         }}
         />
       </SafeAreaView>
     </>
  );
};


export default App;
