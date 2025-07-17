import {JSX} from 'react';
import {Text, View} from 'react-native';
import {getCountryCode} from 'react-native-country-detector';

function App(): JSX.Element {
  const country: string | null = getCountryCode();

  return (
    <View style={{flex: 1, justifyContent: 'center', alignItems: 'center'}}>
      <Text style={{textAlign: 'center', fontSize: 30}} adjustsFontSizeToFit>
        Country Code: {country}
      </Text>
    </View>
  );
}

export default App;
