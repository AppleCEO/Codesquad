import UIKit

func nand(paramA: Bool, paramB: Bool) -> Bool {
    var answer:Bool = true;
    if paramA && paramB {
        answer = false
    }
    return answer;
}

func nor(paramA: Bool, paramB: Bool) -> Bool {
    var answer:Bool = false;
    if !paramA && !paramB {
        answer = true
    }
    return answer;
}

func and(paramA: Bool, paramB: Bool) -> Bool {
    var answer:Bool = false;
    if paramA && paramB {
        answer = true
    }
    return answer;
}

func or(paramA: Bool, paramB: Bool) -> Bool {
    var answer:Bool = true;
    if !paramA && !paramB {
        answer = false
    }
    return answer;
}

func halfadder(_ bitA:Bool, _ bitB:Bool) -> [Bool] {
    if bitA && bitB {
        return [true, false]
    } else if !bitA && !bitB {
        return [false, false]
    } else {
        return [false, true]
    }
}

func fulladder(_ bitA:Bool, _ bitB:Bool, _ carry:Bool) -> [Bool] {
    var step1 = halfadder(bitA, bitB)
    var step2 = halfadder(carry, step1[1])
    
    return [or(paramA: step1[0], paramB: step2[0]), step2[1]]
}

func byteadder(_ byteA:[Bool], _ byteB:[Bool]) -> [Bool] {
    var bin1 = byteA
    var bin2 = byteB
    
    if bin1.count != bin2.count {
        (bin1, bin2) = binsizemacth(byteA, byteB)
    }
        
    var carry = false
    var result = Array<Bool>()
    var sumResult = Array<Bool>()
    for index in 0..<bin1.count {
        sumResult = fulladder(bin1[index], bin2[index], carry)
        carry = sumResult[0]
        result.append(sumResult[1])
    }
    
    result.append(carry)
    
    return result
}

func binsizemacth(_ byteA:[Bool], _ byteB:[Bool]) -> ([Bool], [Bool]) {
    var bin1 = byteA
    var bin2 = byteB
    
    if byteA.count < byteB.count {
        let countDiff = byteB.count-byteA.count
        for _ in 0..<countDiff {
            bin1.append(false)
        }
    } else if byteA.count > byteB.count {
        let countDiff = byteA.count-byteB.count
        for _ in 0..<countDiff {
            bin2.append(false)
        }
    }
    
    return (bin1, bin2)
}

func dec2bin(_ decimal:Int) -> [Bool] {
    var binary = Array<Bool>()
    var input = decimal
    while(true){
        if(input%2>0) {
            binary.append(true)
        } else {
            binary.append(false)
        }
        
        if(input<2){
            break
        } else {
            input /= 2
        }
    }
    
    return binary
}

func bin2dec(_ bin:[Bool]) -> Int {
    var decimal:Int = 0
    var binary:Int = 1
    for input in bin {
        if(input) {
            decimal += binary
        }
        binary *= 2
    }
    
    return decimal
}

let dec1 = 10
let dec2 = 173
let bin1 = dec2bin(dec1)
let bin2 = dec2bin(dec2)
let binSum = byteadder(bin1, bin2)
let decSum = bin2dec(binSum)

print(decSum)
