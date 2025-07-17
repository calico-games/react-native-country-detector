import Foundation

extension Character {
    func unicodeScalarCodePoint() -> UInt32 {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars

        return scalars[scalars.startIndex].value
    }
}

@objc class Mingle: NSObject {

    @objc
    @inline(__always)
    @inlinable
    static func encode(with str: String) -> [UInt32] {
        var re = [UInt32]()
        var idx = UInt32(0)

        for c in str {
            let v = c.unicodeScalarCodePoint()

            if idx % 2 == 0 {
                re.append(v * 2 + 1 + idx)
            } else {
                re.append(v * idx + 1)
            }

            idx += 1
        }

        return re
    }

    @objc
    @inline(__always)
    @inlinable
    static func decode(with arr: [UInt32]) -> String {
        var characters = [Character]()
        var idx = UInt32(0)

        for c in arr {
            var val = (c - 1 - idx) / 2

            if idx % 2 == 1 {
                val = (c - 1) / idx
            }

            if let scalar = UnicodeScalar(val) {
                characters.append(Character(scalar))
            }

            idx += 1
        }

        return String(characters)
    }
}