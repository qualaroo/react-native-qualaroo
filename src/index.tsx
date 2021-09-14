import { NativeModules } from 'react-native';

type QualarooMobileSdkType = {
  multiply(a: number, b: number): Promise<number>;
};

const { QualarooMobileSdk } = NativeModules;

export default QualarooMobileSdk as QualarooMobileSdkType;
