package games.calico.countryDetector

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod

class CountryDetectorModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  private val telephonyManager: CountryTelephonyManager = CountryTelephonyManager(reactContext)

  override fun getName(): String {
    return "CountryDetectorModule"
  }

  @ReactMethod(isBlockingSynchronousMethod = true)
  fun getCountryCode(): String? {
    return try {
      telephonyManager.getCountryCode()
    } catch (e: Exception) {
      null
    }
  }
}