# Country Detector for React Native

This package provides a React Native package for detecting the user's country accurately. It is designed to be used in both iOS and Android apps.

## Device Support 📱

| Platform         | Supported |
| ---------------- | --------- |
| iOS Device       | ✅        |
| iOS Simulator    | ✅        |
| Android Device   | ✅        |
| Android Emulator | ✅        |

## Installation 🚀

To install the package, run the following command:

```sh
npm install react-native-country-detector

or

yarn add react-native-country-detector
```

## Usage 😈

To use the Country Detector in your React Native application, you can import it and call the `getCountryCode` method. Here's an example:

```tsx
import {getCountryCode} from 'react-native-country-detector';

const country: string | null = getCountryCode();

if (country) {
  console.log(`Detected country: ${country}`);
} else {
  console.log('Country could not be detected');
}
```

## API 👀

| Method                                                              | Return Type         |  iOS | Android |
| ------------------------------------------------------------------- | ------------------- | :--: | :-----: |
| getCountryCode()                              | `string \| null`   |  ✅  |   ✅    |

---

## Warnings ⚠️

On iOS, this package uses a private API to determine the country accurately. Use at your own risk. We obsfucate the code to avoid detection. Note that we have used this technique for years in production for multiple apps without any issues 🙂.
