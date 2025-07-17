import {NativeModules} from 'react-native';

const CountryDetector = NativeModules.CountryDetectorModule;

export default CountryDetector;
export const getCountryCode = CountryDetector.getCountryCode;
