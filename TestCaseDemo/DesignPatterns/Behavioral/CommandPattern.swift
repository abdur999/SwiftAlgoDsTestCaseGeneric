//
//  CommandPattern.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 19/09/22.
//

import Foundation

protocol Command {
    func execute()
}

class ConcreteCommand: Command {
    var colorReceiver: ColorReceiver
    
    init(colorReceiver: ColorReceiver) {
        self.colorReceiver = colorReceiver
    }

    func execute() {
        colorReceiver.changeColor()
    }
}

class Invoker {
    func execute(command: Command) {
        command.execute()
    }
}

class ColorReceiver {
    var color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func changeColor() {
        print(color.name)
    }
}

struct Color {
    var name: String
}

class Client {
    let invoker = Invoker()
    
    func showPattern() {
        let colorReceiver = ColorReceiver(color: Color(name: "red"))
        let command: Command = ConcreteCommand(colorReceiver: colorReceiver)
        invoker.execute(command: command)
    }
}
class CommandPattern {
    func testCommandPattern() {
        let client = Client()
        client.showPattern()
//    Output:
//    red
    }
}
