//: Playground - noun: a place where people can play

import UIKit

enum ProductTypeEnumeration {
    case iOS, Android
}

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

//=======简单工厂模式（Simple Factory Pattern）========
//使用“简单工厂模式”将变化的部分进行提取
// 变化的部分就是不同的手机，所以这里有个PhoneFactory用来生产手机 ，将变化的部分直接提取出来作为工厂方法。
// PhoneFactory就是我们的简单工厂
class PhoneFactory {
    
    func createPhoneWithType(productType: ProductTypeEnumeration) -> Phone {
        var phone: Phone
        
        switch productType {
        case .iOS:
            phone = iOSPhone()
        case .Android:
            phone = AndroidPhone()
        }
        
        return phone
    }
}

class PhoneUser {
    var phoneFactory: PhoneFactory
    
    init(phoneFactory: PhoneFactory) {
        self.phoneFactory = phoneFactory
    }
    
    func callWithType(productType: ProductTypeEnumeration) {
        let phone: Phone = phoneFactory.createPhoneWithType(productType: productType)
        print(phone.call())
    }
}
let phoneUser: PhoneUser = PhoneUser(phoneFactory: PhoneFactory())
phoneUser.callWithType(productType: .iOS)
phoneUser.callWithType(productType: .Android)
