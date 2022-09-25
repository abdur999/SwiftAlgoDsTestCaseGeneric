//
//  Swift4-2.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 16/09/22.
//

import Foundation
/*
 Derived collections of enum cases
SE-0194 introduces a new CaseIterable protocol that automatically generates an array property of all cases in an enum.

Prior to Swift 4.2 this either took hacks, hand-coding, or Sourcery code generation to accomplish, but now all you need to do is make your enum conform to the CaseIterable protocol
 */
enum Pasta: CaseIterable {
    case cannelloni, fusilli, linguine, tagliatelle
}

enum Car4: CaseIterable {
    //This automatic synthesis of allCases will only take place for enums that do not use associated values. Adding those automatically wouldn’t make sense, however if you want you can add it yourself:
    static var allCases: [Car4] {
        return [.ford, .toyota, .jaguar, .bmw, .porsche(convertible: false), .porsche(convertible: true)]
    }

    case ford, toyota, jaguar, bmw
    case porsche(convertible: Bool)
}

/*
Dynamic member look up
SE-0195 introduces a way to bring Swift closer to scripting languages such as Python, but in a type-safe way – you don’t lose any of Swift’s safety, but you do gain the ability to write the kind of code you’re more likely to see in PHP and Python.

At the core of this feature is a new attribute called @dynamicMemberLookup, which instructs Swift to call a subscript method when accessing properties. This subscript method, subscript(dynamicMember:), is required: you’ll get passed the string name of the property that was requested, and can return any value you like.
 */
@dynamicMemberLookup
struct Person4_2 {
    subscript(dynamicMember member: String) -> String {
        let properties = ["name": "Taylor Swift", "city": "Nashville"]
        return properties[member, default: ""]
    }
}

/*Boolean toggling
SE-0199 introduces a new toggle() method to booleans that flip them between true and false. This caused a lot of discussion in the Swift community, partly because some thought it too trivial for inclusion
 However, the end result makes for much more natural Swift code:
 */

extension Bool {
    mutating func toggle() {
        self = !self
    }
}


class Test4_2 {
    func iterable() {
        for shape in Pasta.allCases {
            print("I like eating \(shape).")
        }
        for car in Car4.allCases {
            print("I like the car \(car).")
        }
    }
    
    
    //That will compile cleanly and run, even though name, city, and favoriteIceCream do not exist as properties on the Person type. Instead, they are all looked up at runtime: that code will print “Taylor Swift” and “Nashville” for the first two calls to print(), then an empty string for the final one because our dictionary doesn’t store anything for favoriteIceCream.
    func memberLookUp() {
        let person = Person4_2()
        print(person.name)
        print(person.city)
        print(person.favoriteIceCream)
    }
}
