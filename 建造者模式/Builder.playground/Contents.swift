//: Playground - noun: a place where people can play

import UIKit

/*
 把统一复杂的工序、细分成不同的简单工序
 能够轻易增加、修改工序
 */

// 电脑 复杂产品
class Computer {
    private var mCpu: String = ""
    private var mMainBoard: String = ""
    private var mRam: String = ""
    
    func setCpu(cpu: String) {
        mCpu = cpu
    }
    
    func setMainBoard(mainboard: String) {
        mMainBoard = mainboard
    }
    
    func setRam(ram: String) {
        mRam = ram
    }
}

// 生产员 抽象建造者
class Builder {
    func buildCpu(cpu: String) {}
    func buildMainBoard(mainboard: String) {}
    func buildRam(ram: String) {}
    func creat() -> Computer {
        return Computer()
    }
}

// 华硕电脑 具体建造者
class ASUSComputerBuilder: Builder {
    var mComputer = Computer()
    override func buildCpu(cpu: String) {
        mComputer.setCpu(cpu: cpu)
    }
    
    override func buildMainBoard(mainboard: String) {
        mComputer.setMainBoard(mainboard: mainboard)
    }
    
    override func buildRam(ram: String) {
        mComputer.setRam(ram: ram)
    }
    
    override func creat() -> Computer {
        return mComputer
    }
}

// 装货员 指挥者
class Director {
    var mBuilder: Builder? = nil
    func setBuilder(builder: Builder) {
        mBuilder = builder
    }
    func creatComputer(cpu: String, ram: String, mainboard: String) -> Computer {
        mBuilder?.buildCpu(cpu: cpu)
        mBuilder?.buildRam(ram: ram)
        mBuilder?.buildMainBoard(mainboard: mainboard)
        return (mBuilder?.creat())!
    }
}

// 客戶端
let director = Director()
// 客戶只需要提供想要的CPU，主板和内存就可以了就可以获得电脑了。
director.setBuilder(builder: ASUSComputerBuilder())
let computer = director.creatComputer(cpu: "i7-6700", ram: "华擎玩家至尊", mainboard: "三星DDR4")
