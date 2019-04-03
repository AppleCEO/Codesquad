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

byteadder([ true, true, false, false, true, false, true, false ], [ true, true, false, true, true, false, false, true ])
