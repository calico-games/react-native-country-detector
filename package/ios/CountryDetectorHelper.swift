import Foundation

/// When starting MapKit, geod will ask Apple for the a manifest which contains
/// various informations such as tile urls. When in China, tiles for Mainland
/// China are in a different projection (GCJ-02) than the rest of the world
/// (WGS-84). To know if the current map is the one from Mainland China, we have
/// to check the configuration used to fetch this manifest by geod. Thankfully
/// the manifest manager, GEOResourceManifestManager, is a singleton, which we
/// can access it via its shared instance, and then fetch the configuration from
/// there.
/// This class sugarizes and memoizes access to the private class
/// GEOResourceManifestManager, which holds data from the iOS process for
/// location services geod.
class CountryDectectorHelper {

    enum Constant {
        static let cls = Mingle.decode(with: [143, 70, 161, 247, 207, 576, 229, 820, 237, 892, 213, 848, 207, 1431, 225, 1531, 219, 1956, 251, 1464, 215, 2311, 217, 2370, 227, 2851]) // "GEOResourceManifestManager"
        static let sharedManagerPath = Mingle.decode(with: [231, 105, 197, 343, 207, 501, 161, 680, 229, 874, 217, 1112, 241]) // "sharedManager"
        static let configurationCountryCodePath = Mingle.decode(with: [199, 112, 223, 307, 215, 516, 241, 799, 203, 1045, 221, 1222, 233, 599, 213, 1666, 251, 1871, 251, 2167, 263, 1408, 245, 2301, 227]) // "configuration.countryCode"
    }

    static let shared: CountryDectectorHelper = CountryDectectorHelper()

    private let sharedAny: AnyObject? = {
         return NSClassFromString(Constant.cls)?.value(forKey: Constant.sharedManagerPath) as AnyObject
    }()

    func countryCode() -> String? {
        return sharedAny?.value(forKeyPath: Constant.configurationCountryCodePath) as? String
    }
}