import UIKit

// 기능

// 텔레비전이라는 대상들을 표현하겠다
// 클래스는 특징과 기능을 가진다
class Television {
    
    // 특징 - 프로퍼티
    var isTurnOn: Bool = false
    var volume: UInt = 5
    var channel: UInt = 1
    let screenSize: Float = 65.3
    var resolution: CGSize = CGSize(width: 1920, height: 1080)
    
    
    // 기능 - 메서드 : 어떤 타입에 구현된 함수다(struct, enum 등에 붙은것도 메소드)
    func change(channel: UInt) {
        
    }
}

//메서드를 호출한다 = 메시지를 주고받는다
//시키기만 하면 메시지를 준다
//리턴해서 받으면 메시지를 받는다
//주거나 받을게 없으면 메시지를 던져준다


