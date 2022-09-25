//
//  Swift4-0.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 15/09/22.
//

import Foundation


/*
 Swift 4 introduces a new Codable protocol that lets you serialize and deserialize custom data types without writing any special code – and without having to worry about losing your value types. Even better, you can choose how you want the data to be serialized: you can use classic property list format or even JSON.

 Yes, you read all that correctly: Swift 4 lets you serialize your custom data types to JSON without writing any special code.
*/
struct Language: Codable {
    var name: String
    var version: Int
}


/*:
 Key paths are formed by starting at a root type and drilling down any combination of property and subscript names.
 
 You write a key path by starting with a backslash: `\Book.title`. Every type automatically gets a `[keyPath: …]` subscript to get or set the value at the specified key path.
 */

struct Person {
    var name: String
}

struct Book {
    var title: String
    var authors: [Person]
    var primaryAuthor: Person {
        return authors.first!
    }
}




class Swift4Test {
    
    func testCodable() {
        let swift = Language(name: "Swift", version: 4)
        let php = Language(name: "PHP", version: 7)
        let perl = Language(name: "Perl", version: 6)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(swift) {
            // save `encoded` somewhere
        }
        
        if let encoded = try? encoder.encode(swift) {
            if let json = String(data: encoded, encoding: .utf8) {
                print(json)
            }

            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(Language.self, from: encoded) {
                print(decoded.name)
            }
        }
        
    }
    
    /*
     Writing multi-line strings in Swift has always meant adding \n inside your strings to add line breaks wherever you want them. This doesn't look good in code, but at least it displays correctly for users. Fortunately, Swift 4 introduces new multi-line string literal syntax that lets you add line breaks freely and use quote marks without escaping, while still benefiting from functionality like string interpolation.

     To start a string literal, you need to write three double quotation marks: """ then press return. You can then go ahead and write a string as long as you want, including variables and line breaks, before ending your string by pressing return then writing three more double quotation marks.
     */
    func multiLineStringTest() {
        let longString = """
        When you write a string that spans multiple
        lines make sure you start its content on a
        line all of its own, and end it with three
        quotes also on a line of their own.
        Multi-line strings also let you write "quote marks"
        freely inside your strings, which is great!
        """
    }
    
    /*
     Last but not least, Swift 4 introduces Python-like one-sided collection slicing, where the missing side is automatically inferred to be the start or end of the collection. This has no effect on existing code because it's a new use for the existing operator, so you don't need to worry about potential breakage.
     */
    func oneSidedRange() {
        let characters = ["Dr Horrible", "Captain Hammer", "Penny", "Bad Horse", "Moist"]
        let bigParts = characters[..<3]
        let smallParts = characters[3...]
        print(bigParts)
        print(smallParts)
    }
    
    func keyPathSample() {
        let abelson = Person(name: "Harold Abelson")
        let sussman = Person(name: "Gerald Jay Sussman")
        let book = Book(title: "Structure and Interpretation of Computer Programs", authors: [abelson, sussman])


        book[keyPath: \Book.title]
        // Key paths can drill down multiple levels
        // They also work for computed properties
        book[keyPath: \Book.primaryAuthor.name]

        /*:
         Key paths are objects that can be stored and manipulated. For example, you can append additional segments to a key path to drill down further.
         */
        let authorKeyPath = \Book.primaryAuthor
        type(of: authorKeyPath)
        // You can omit the type name if the compiler can infer it
        let nameKeyPath = authorKeyPath.appending(path: \.name)
        book[keyPath: nameKeyPath]
        
        // Now possible in Swift 4.0.3
        book[keyPath: \Book.authors[0].name]
    }
}

