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

nor(paramA: false, paramB: false)


