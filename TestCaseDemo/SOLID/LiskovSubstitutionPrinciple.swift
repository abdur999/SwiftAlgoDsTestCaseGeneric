//
//  LiskovSubstitutionPrinciple.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 08/09/22.
//

import Foundation

// LiskovSubstitutionPrinciple Breaks here.
// We cannot do any modification of parent class but we change the Rectangle proprty width and height
//This break LSP

/*
class NSRectangle {
    var width: Int
    var height: Int

    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }

    func area() -> Int {
        return width * height
    }
}

class NSSquare: NSRectangle {
    override var width: Int {
        didSet {
            super.height = width
        }
    }

    override var height: Int {
        didSet {
            super.width = height
        }
    }
}
 */



// LiskovSubstitutionPrinciple implemented here.
// We cannot do any modification of parent class and we dont do this
/*
   Liskov Substitution Principle (LSP) states that objects of a superclass should be replaceable with objects of its subclasses without breaking the application. In other words, what we want is to have the objects of our subclasses behaving the same way as the objects of our superclass.
 
 */

protocol Geometrics {
    func area() -> Int
}

class Rectangle: Geometrics {
    var width: Int
    var height: Int

    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }

    func area() -> Int {
        return width * height
    }
}

class Square: Geometrics {
    var edge: Int

    init(edge: Int) {
        self.edge = edge
    }

    func area() -> Int {
        return edge * edge
    }
}
