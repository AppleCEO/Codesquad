import UIKit

//gugu() 함수 선언부(callee)
func gugu(number : Int) {
    let j = number
    var gugudan = [Int].init(repeating: 0, count: 9)
    
    var index=0
    for _ in gugudan {
        gugudan[index] = j*(index+1)
        index+=1
    }
    
    for i in gugudan {
        print("\(j) * \(i/j) = \(i)")
    }
}

//gugu() 함수 호출부(caller)
for i in 1...9 {
    gugu(number: i)
}

