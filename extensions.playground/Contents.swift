import UIKit

extension Int {
    func intToDouble () -> Double { return Double(self) }
    func checkBinary () -> Bool { return self%2 == 0 }
}

extension Float {
    func floatToDouble () -> Double { return Double(self) }
}

var a = 5
var d = a.intToDouble()
a.checkBinary()

var b: Float = 5.4
var c = b.floatToDouble()


