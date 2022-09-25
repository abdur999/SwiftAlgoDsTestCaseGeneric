//
//  Adapter.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 13/09/22.
//

import Foundation
/*
Adaptee

The object we are adapting to a specific target (eg. old-school USB-A port).

Adapter

An object that wraps the original one and produces the new requirements specified by some target interface (this does the actual work, aka. the little dongle above).
 */


protocol Jumping {
  func jump()
}

class Dog: Jumping {
  func jump() {
    print("Jumps Excitedly")
  }
}

class Cat: Jumping {
  func jump() {
    print("Pounces")
  }
}

class Frog {
  func leap() {
    print("Leaps")
  }
}

extension Frog: Jumping {
  func jump() {
    leap()
  }
}


class TestAdapter {
    let dog = Dog()
    let cat = Cat()
    let frog = Frog()
    var animals: [Jumping] = []
    
    init() {
        animals = [dog, cat, frog]
    }
    
    func jumpAll(animals: [Jumping]) {
        for animal in animals {
            animal.jump()
        }
    }
}
