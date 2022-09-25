//
//  Bridge.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 13/09/22.
//

import Foundation


/*
 Bridge Pattern decouple an abstraction from its implementation so that the two can vary independently.
Bridge pattern delighted me a lot when I learnt this for first time. It really helps you when you don’t know exact business logic to implement but you need to flourish your abstraction due to deadline of project. When business logic comes from clients requirement need to code only business logic.
 
 
 Participants:
 Abstraction: Defines the abstraction’s interface. Maintains a reference to an object of type Implementor.
 RefinedAbstraction: Extends the interface defined by Abstraction.
 Implementor: Defines the interface for implementation classes. This interface doesn’t have to correspond exactly to Abstraction’s interface; in fact the two interfaces can be quite different. Typically the Implementor interface provides only primitive operations, and Abstraction defines higher-level operations based on these primitives.
 ConcreteImplementor: implements the Implementor interface and defines its concrete implementation.
 
 */

import Foundation

public class Shape {
    
    let graphicsApi: GraphicsAPI
    
    init(_ graphicsApi: GraphicsAPI) {
        self.graphicsApi = graphicsApi
    }
    
    func draw() -> Void {
        
    }
}

public class Circle : Shape {
    var x: Int = 0
    var y: Int = 0
    var radius: Int = 0
    
    convenience init(_ x: Int, _ y: Int, _ radius: Int, _ graphicsApi: GraphicsAPI) {
        self.init(graphicsApi)
        self.x = x
        self.y = y
        self.radius = radius
    }
    
    override func draw() -> Void {
        self.graphicsApi.drawCircle(self.x, self.y, self.radius)
    }
}

public class BRectangle : Shape {
    var x: Int = 0
    var y: Int = 0
    var width: Int = 0
    var height: Int = 0
    
    convenience init(_ x: Int, _ y: Int, _ width: Int, _ height: Int, _ graphicsApi: GraphicsAPI) {
        self.init(graphicsApi)
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
    
    override func draw() -> Void {
        self.graphicsApi.drawRectangle(x, y, width, height)
    }
}


protocol GraphicsAPI {
    func drawRectangle(_ x: Int, _ y: Int, _ width: Int, _ height: Int)
    func drawCircle(_ x: Int, _ y: Int, _ radius: Int)
}

class DirectXAPI : GraphicsAPI {
    
    func drawRectangle(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        print("Rectangle drawn by DirectXAPI API");
    }
    
    func drawCircle(_ x: Int, _ y: Int, _ radius: Int) {
        print("Circle drawn by DirectXAPI API");
    }
}

public class OpenGLAPI : GraphicsAPI {
    
    func drawRectangle(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        print("Rectangle drawn by OpenGL API")
    }
    
    func drawCircle(_ x: Int, _ y: Int, _ radius: Int) {
        print("Circle drawn by OpenGL API")
    }
}

class TestBridgePattern {
    func testBridge() {
    // Bridge pattern is good for run time binding of implementation
    var openGLApi: OpenGLAPI = OpenGLAPI()
    var directXApi: DirectXAPI = DirectXAPI()

    var circle: Circle = Circle(10, 10, 10, openGLApi)
    circle.draw()

    circle = Circle(10, 5, 4, directXApi)
    circle.draw()

    var rect: BRectangle = BRectangle(10, 10, 10, 10, openGLApi)
    rect.draw()

    rect = BRectangle(10, 10, 10, 10, directXApi)
    rect.draw()
    }
    
}
