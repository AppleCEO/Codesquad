import UIKit


class Memory {
    let bytesPointer = UnsafeMutableRawPointer.allocate(byteCount: 2, alignment: 1)
    
    init() {
        bytesPointer.initializeMemory(as: , repeating: 0, count: 131072)
    }
    
    func peek(address: UInt32) {
        switch address {
        case 0...65535:
            let pointerToRead = self.bytesPointer + Int(address)
            let dataReaded = pointerToRead.load(as: UInt16.self)
            dump(dataReaded)
        case 65536...131071:
            break
        default:
            print("out of range exception")
        }
    }
  
    func store(address: Int16, data: Int16) {
        
    }
//    func load(address: UInt16){
//
//        let y = bytesPointer.load(fromByteOffset: address , as: UInt16.self)
//        print(y)
//    }
}

var memory:Memory = Memory()
dump(memory.bytesPointer)
//memory.peek(address: 5)

