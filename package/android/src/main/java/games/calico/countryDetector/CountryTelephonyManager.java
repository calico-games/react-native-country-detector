package games.calico.countrydetector;

import android.content.Context;
import android.telephony.TelephonyManager;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.util.Log;

public class CountryTelephonyManager {
    private static final String TAG = "CountryTelephonyManager";

    private final Context context;

    public CountryTelephonyManager(Context context) {
        this.context = context;
    }

    public String getCountryCode() {
        // Try multiple methods to get country code
        TelephonyManager tm = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
        
        if (tm != null) {
            // Try network country ISO (most reliable when connected to network)
            String networkCountry = tm.getNetworkCountryIso();
            if (networkCountry != null && !networkCountry.isEmpty()) {
                return networkCountry.toUpperCase();
            }
            
            // Try SIM country ISO (works when SIM is present)
            String simCountry = tm.getSimCountryIso();
            if (simCountry != null && !simCountry.isEmpty()) {
                return simCountry.toUpperCase();
            }
        }
        
        // Fallback to locale country
        String localeCountry = context.getResources().getConfiguration().locale.getCountry();
        if (localeCountry != null && !localeCountry.isEmpty()) {
            return localeCountry.toUpperCase();
        }
        
        return null;
    }
}
