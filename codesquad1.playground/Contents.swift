import UIKit

var j = 2
var gugudan = [Int].init(repeating: 0, count: 9)

var index=0
for i in gugudan {
    gugudan[index] = j*(index+1)
    index+=1
}

for i in gugudan {
    print("\(j) * \(i/j) = \(i)")
}
