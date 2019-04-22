import UIKit

protocol Drivable {
    func drive()
    var driverLicense: String { get }
}

protocol Brewable {
    func brewCoffee()
}

class ABC: NSObject { // NSObject 클래스를 상속받았다
    
}

protocol Viseoable: Drivable, Brewable {
    func manageScheduled()
    
    var certification: String { get }
}

struct Secatery: Viseoable, Brewable { // 프로토콜을 상속받았다는 표현은 절대 하지않는다. 이 프로토콜을 채택했다고 표현한다.
    func manageScheduled() {
        print("척척 스케쥴 관리 잘했어요")
    }
    
    func brewCoffee() {
        print("저는 다방커피 파입니다")
    }
    
    func drive() {
        print("포르쉐 아니면 안몰아요")
    }
    
    var certification: String
    
    var driverLicense: String
    
    
}

let sec1: Secatery = Secatery(certification: "한국대학교 졸업장", driverLicense: "2동 자동")

struct Assistant: Drivable, Brewable {
    func manageScheduled() {
        print("저는 제 스케쥴도 잘 못다루지만... 잘 해볼게요")
    }
    func brewCoffee() {
        print("저는 아메리카노파")
    }
    
    func drive() {
        print("티코부터 에쿠스까지 맡겨만 주십쇼")
    }
    
    var certification: String
    
    var driverLicense: String
    
    
}

let sec2: Assistant = Assistant(certification: "한국대학교 석사", driverLicense: "1종 보통")

struct Sajang {
    var viseo: Drivable&Brewable // protocol 과 protocol의 조합이나 타입 한가지만 가능, 프로토콜 타입이고 채택했다고 하지 않음
}

var master: Sajang = Sajang(viseo: sec2)
//master.viseo = sec2

