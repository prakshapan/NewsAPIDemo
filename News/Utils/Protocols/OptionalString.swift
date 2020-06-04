import Foundation

protocol OptionalString {}
extension String: OptionalString {}

extension Optional where Wrapped: OptionalString {
  
  var isNilOrEmpty: Bool {
    return ((self as? String) ?? "").isEmpty
  }
  
  var isNotNilOrEmpty: Bool {
    return !((self as? String) ?? "").isEmpty
  }
  
}
