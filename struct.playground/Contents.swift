import UIKit

struct Person {
    let name: String = "don"
    var age: UInt
    var nickname: String?
    
    init(name: String, age: UInt = 29, nickname: String? = nil) {
        
        self.age = age
        self.nickname = nickname
    }
    
    init(age: UInt) {
        self.age = age
    }
}

var yagom: Person = Person(name: "yagom", nickname: "야곰")

// 오버로딩, 오버라이딩 찾아보기

var dominic: Person = Person(age: 15)
// 연산 프로퍼티는 메서드로 생각해도 된다. (초기값을 넣어줄 수 없다)
