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
    var carry = false
    var result = Array<Bool>()
    var sumResult = Array<Bool>()
    for index in 0..<byteA.count {
        sumResult = fulladder(byteA[index], byteB[index], carry)
        carry = sumResult[0]
        result.append(sumResult[1])
    }
    
    result.append(carry)
    
    return result
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

dec2bin(10)
dec2bin(173)
