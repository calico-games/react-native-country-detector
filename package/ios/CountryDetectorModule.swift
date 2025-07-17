import Foundation
import React

@objc(CountryDetectorModule)
class CountryDetectorModule: NSObject, RCTBridgeModule {

    static func moduleName() -> String! {
        return "CountryDetectorModule"
    }

    static func requiresMainQueueSetup() -> Bool {
        return false
    }
    
    @objc
    func constantsToExport() -> [AnyHashable : Any]! {
        return [:]
    }
    
    @objc(getCountryCode)
    func getCountryCode() -> String? {
        return CountryDectectorHelper.shared.countryCode()
    }
}
