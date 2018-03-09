//: Playground - noun: a place where people can play

import UIKit

//: Playground - noun: a place where people can play

import UIKit

enum ProductTypeEnumeration {
    case iOS, Android
}

//产品等级结构--手机
protocol Phone {
    func call() -> String
}

class iOSPhone: Phone {
    func call() -> String {
        return "iOSPhone is calling"
    }
}

class AndroidPhone: Phone {
    func call() -> String {
        return "AndroidPhone is calling"
    }
}

//产品等级结构--平板
protocol Pad {
    func playMovie() -> String
}

class iOSPad: Pad {
    func playMovie() -> String {
        return "iOSPad is playing movie..."
    }
}

class AndroidPad: Pad {
    func playMovie() -> String {
        return "AndriodPad is playing movie..."
    }
}

//抽象工厂
protocol MobileFactory {
    func creatPhone() -> Phone
    func creatPad() -> Pad
}

//具体工厂
class iOSFactory: MobileFactory {
    func creatPhone() -> Phone {
        return iOSPhone()
    }
    
    func creatPad() -> Pad {
        return iOSPad()
    }
}

class AndroidFactory: MobileFactory {
    func creatPhone() -> Phone {
        return AndroidPhone()
    }
    
    func creatPad() -> Pad {
        return AndroidPad()
    }
}

class MobileUser {
    var mobileFactory: MobileFactory
    
    init(mobileFactory: MobileFactory) {
        self.mobileFactory = mobileFactory
    }
    
    func call() {
        let phone: Phone = mobileFactory.creatPhone()
        print(phone.call())
    }
    
    func playMovie() {
        let pad: Pad = mobileFactory.creatPad()
        print(pad.playMovie())
    }
}

let iosUser: MobileUser = MobileUser(mobileFactory: iOSFactory())
iosUser.call()
iosUser.playMovie()

let andriodUser: MobileUser = MobileUser(mobileFactory: AndroidFactory())
andriodUser.call()
andriodUser.playMovie()
