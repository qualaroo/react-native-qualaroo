import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-qualaroo-mobile-sdk' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const QualarooMobileSdk = NativeModules.QualarooMobileSdk
  ? NativeModules.QualarooMobileSdk
  : new Proxy(
    {},
    {
      get() {
        console.log(LINKING_ERROR)
        throw new Error(LINKING_ERROR);
      },
    }
  );

export default QualarooMobileSdk;
