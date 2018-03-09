//: Playground - noun: a place where people can play

import UIKit

enum PhoneTypeEnumeration {
    case iOS, Android
}

protocol PhoneType {
    func call() -> String
}

class iOS: PhoneType {
    func call() -> String {
        return "iOSPhone is calling"
    }
}

class Android: PhoneType {
    func call() -> String {
        return "AndroidPhone is calling"
    }
}

class PhoneUser {
    func callWithType(phoneType: PhoneTypeEnumeration) {
        var phone: PhoneType
        
        switch phoneType {
        case .iOS:
            phone = iOS()
        case .Android:
            phone = Android()
        }
        
        print(phone.call())
    }
}


let phoneUser: PhoneUser = PhoneUser()

phoneUser.callWithType(phoneType: .iOS)
phoneUser.callWithType(phoneType: .Android)
