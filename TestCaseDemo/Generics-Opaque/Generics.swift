//
//  Generics.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 11/09/22.
//

import Foundation

class GenericFunction {
    // create a generic function
    func displayData<T>(data: T) {
        print("Generic Function:")
        print("Data Passed:", data)
    }
    func CallGenerics() {
        // generic function working with String
        displayData(data: "Swift")
        
        // generic function working with Int
        displayData(data: 5)
    }
}

//GENERIC STACK ANY TYPE OF DATA CAN BE PASSED
//CUSTOM STRUCT, CUSTOM CLASS, Int, String,
struct Stack<Element> {
    var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }
}

//ARRAY EXTENSION FOR GENERIC
extension Array where Element == String {
    func uppercaseAll() -> [Element] {
        map { $0.uppercased() }
    }
}
//USE OF FUNCTION
class UseOFExtension {
    func callArrayExtension() {
    ["Bernie", "Jaap", "Lady"].uppercaseAll()
    }
}

class CustomConvert {
    func printElement<T>(_ element: T) where T: CustomStringConvertible {
        print(element)
    }
//    You can use OPAQUE types instead of generics whenever you’re using generics in a single place.
//    The above print method uses the generic T only within the method definition,
//    and you can therefore rewrite it as follow
    func makeOpaqueContainer<T>(item: T) -> some Container {
        return [item]
    }
    
    func callOpaqueType() {
    let opaqueContainer = makeOpaqueContainer(item: [12,13,14,15])
    let twelve = opaqueContainer[0]
    print(type(of: twelve))
    }
    
    func callCutomConvert(){
        printElement([12,13,14,15])
    }
}
// GENERIC TYPE FOR OPAQUE
protocol Container {
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
extension Array: Container { }



