//
//  StrategyPattern.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 19/09/22.
//

import Foundation

protocol Strategy {
    func convert(number: Int)
}

class Convert {
    var strategy: Strategy
    var number: Int
    
    init(number: Int, strategy: Strategy) {
        self.number = number
        self.strategy = strategy
    }
    
    func update() {
        self.strategy.convert(number: number)
    }
}

class BinaryStrategy: Strategy {
    func convert(number: Int) {
        let binary = String(number, radix: 2)
        print("Binary is \(binary)")
    }
}

class HexStrategy: Strategy {
    func convert(number: Int) {
        let hex = String(number, radix: 16)
        print("Hex is \(hex)")
    }
}

class TestStrategyPattern {
    func testStrategy() {
        let binaryConvert = Convert(number: 2, strategy: BinaryStrategy())
        binaryConvert.update()
        let hexConvert = Convert(number: 123, strategy: HexStrategy())
        hexConvert.update()
//        Output:
//        Binary is 10
//        Hex is 7b
    }
}
