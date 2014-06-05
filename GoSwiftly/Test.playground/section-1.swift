
import Foundation

func _tap<T>(object: T, closure: (T) -> T) -> T {
    return closure(object)
}

extension String {
    func tap(closure: (String) -> String) -> String {
        return _tap(self, closure)
    }
}

extension NSObject {
    class func identifier() -> String {
        return NSStringFromClass(self).tap {
            return $0.substringWithRange("_TtC9GoSwiftly7".endIndex..$0.endIndex)
        }
    }
}

class Test <T> : NSObject {
    
}

Test<String>()
Test<String>.identifier()
