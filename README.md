# Country Detector for React Native

This package provides a React Native package for detecting the user's country accurately. It is designed to be used in both iOS and Android apps.
It was designed because of `react-native-device-info` not being accurate enough for our use case.

‼️ On iOS, it uses a private API to determine the country, while on Android multiple methods are employed to ensure accuracy, including checking the SIM card, network operator, and locale settings.

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

To use the Country Detector in your React Native application, you can import it and call the `getCountry` method. Here's an example:

```tsx
import {getCountry} from 'react-native-country-detector';

const country: string | null = getCountryCode();

if (country) {
  console.log(`Detected country: ${country}`);
} else {
  console.log('Country could not be detected');
}
```

## API 👀

| Method                                                              | Return Type         |  iOS | Android | Windows | Web  | visionOS |
| ------------------------------------------------------------------- | ------------------- | :--: | :-----: | :-----: | :-:  | :------: |
| getCountryCode()                              | `string \| null`   |  ✅  |   ✅    |   ✅     | ✅   |   ✅     |

---

## Warnings ⚠️

- **iOS**: The package uses a private API to determine the country, which **may** lead to rejection from the App Store. Use at your own risk. We obsfucate the code to avoid detection. Note that we have used this technique for years in production apps without any issues 🙂.
