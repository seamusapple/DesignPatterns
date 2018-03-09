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

//=========工厂方法模式(Factory Method Pattern)========
/// 工厂方法模式：定义了一个创建对象的接口，但由子类决定要实例化的类是哪一个。工厂方法让类把实例化推迟到子类。
//依赖倒置原则：要依赖抽象，不要依赖具体类

protocol PhoneFactory {
    func createPhone() -> Phone!
}

class iOSPhoneFactory: PhoneFactory {
    func createPhone() -> Phone! {
        return iOSPhone()
    }
}

class AndroidPhoneFactory: PhoneFactory {
    func createPhone() -> Phone! {
        return AndroidPhone()
    }
}

class PhoneUser {
    var phoneFactory: PhoneFactory
    
    init(phoneFactory: PhoneFactory) {
        self.phoneFactory = phoneFactory
    }
    
    func call() {
        let phone: Phone = phoneFactory.createPhone()
        print(phone.call())
    }
}

let phoneUser: PhoneUser = PhoneUser(phoneFactory: iOSPhoneFactory())
phoneUser.call()
