//: Playground - noun: a place where people can play

import UIKit

/**
 * 外观模式
 *
 */

class SwitchFacade {
    private var light: Light = Light()
    private var airCondition: AirCondition = AirCondition()
    private var electricFan: ElectricFan = ElectricFan()
    private var teleVision: TeleVision = TeleVision()
    
    /**
     * 晚上开电灯
     *
     */
    func night(isOpen: Bool) {
        if isOpen {
            light.on()
            airCondition.on()
            electricFan.on()
            teleVision.on()
        } else  {
            light.off()
            airCondition.off()
            electricFan.off()
            teleVision.off()
        }
    }
    
    /**
     * 白天不需要电灯
     *
     */
    func day(isOpen: Bool) {
        if isOpen {
            airCondition.on()
            electricFan.on()
            teleVision.on()
        } else {
            airCondition.off()
            electricFan.off()
            teleVision.off()
        }
    }
}

/**
 * 子系统类
 *
 */
class Light {
    private var isOpen: Bool = true
    func on() {
        print("Light is on")
        isOpen = true
    }
    
    func off() {
        print("Light is off")
        isOpen = false
    }
}

class AirCondition {
    private var isOpen: Bool = true
    func on() {
        print("AirCondition is on")
        isOpen = true
    }
    
    func off() {
        print("AirCondition is off")
        isOpen = false
    }
}

class ElectricFan {
    private var isOpen: Bool = true
    func on() {
        print("ElectricFan is on")
        isOpen = true
    }
    
    func off() {
        print("ElectricFan is off")
        isOpen = false
    }
}

class TeleVision {
    private var isOpen: Bool = true
    func on() {
        print("TeleVision is on")
        isOpen = true
    }
    
    func off() {
        print("TeleVision is off")
        isOpen = false
    }
}

/**
 * 客户类
 *
 */
class Client {
    private let facade = SwitchFacade()
    func dayOpen() {
        facade.day(isOpen: true)
    }
    
    func dayClose() {
        facade.day(isOpen: false)
    }
    
    func nightOpen() {
        facade.night(isOpen: true)
    }
    
    func nightClose() {
        facade.night(isOpen: false)
    }
}

let client = Client()
client.dayOpen()
client.dayClose()
client.nightOpen()
client.nightClose()