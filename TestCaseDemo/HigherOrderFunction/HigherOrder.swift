//
//  HigherOrder.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 12/09/22.
//

import Foundation
//Higher-order functions are functions that take other functions or closures as arguments and that return a function or a closure.
//These functions are used with arrays, sets, and dictionaries and act on the elements they contain (this is done by methods that are applied to the elements of the collection using the point syntax).

//Some of the best-known functions are map, compactMap, flatMap, reduce, filter, contains, sorted, forEach, and removeAll.

class HigherOrder {
    
    func withOutMap() {
        let words: [String] = ["room", "home", "train", "green", "heroe"]
        var uppercasedWords: [String] = [String]()
        
        for word in words {
            uppercasedWords.append(word.uppercased())
        }
    }
    // uppercasedWords = ["ROOM", "HOME", "TRAIN", "GREEN", "HEROE"]
    
    //func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
    func usingMap() {
        let words: [String] = ["room", "home", "train", "green", "heroe"]
        
        let uppercasedWords = words.map({ word in
            return word.uppercased()
        })
    }
    
    //func compactMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]
    func withCompactMap() {
        let words: [String?] = ["room", "home", nil, nil, "train", nil, nil, "green", "heroe", nil]
        let uppercasedWords = words.compactMap { $0?.uppercased
            
        }
        
        // uppercasedWords = ["ROOM", "HOME", "TRAIN", "GREEN", "HEROE"]
    }
    
    func withOutFlatMap() {
        let words: [[String]] = [["room", "home"], ["train", "green"], ["heroe"]]
        var singleArray: [String] = [String]()
        
        for individualArray in words {
            for word in individualArray {
                singleArray.append(word)
            }
        }
        
        // singleArray = ["room", "home", "train", "green", "heroe"]
    }
    
    //func flatMap<SegmentOfResult>(_ transform: (Self.Element) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Element] where SegmentOfResult : Sequence
    
    func withflatMap() {
        let words: [[String]] = [["room", "home"], ["train", "green"], ["heroe"]]
        let singleArray = words.flatMap { $0 }
        // singleArray = ["room", "home", "train", "green", "heroe"]
    }
    
    
    func withOutReduce() {
        let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        var result: Int = 0
        
        for number in numbers {
            result += number
        }
        
        // result = 55
    }
    
    
    //reduce is a function that, when applied to a collection, returns the result of combining the elements of that collection:
    //func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
    
    func withReduce() {
        let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        let sum = numbers.reduce(0, { x, y in
            return x + y
        })
        
        //or
        //let sum = numbers.reduce(0, { $0 + $1 })
        
        // sum = 55
    }
    
    
    func withOutFilter() {
        let words: [String] = ["room", "home", "train", "green", "heroe"]
        
        var wordsWithO: [String] = [String]()
        
        for word in words {
            for letter in word {
                if letter == "o" {
                    wordsWithO.append(word)
                    break
                }
            }
        }
        // wordsWithO = ["room", "home", "heroe"]
    }
    
    //As its name suggests, the filter function filters the content of a collection and returns a new collection that contains the elements that meet a certain condition
    //func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> [Self.Element]
    func withFilter() {
        let words: [String] = ["room", "home", "train", "green", "heroe"]
        
        let wordsWithO = words.filter { $0.contains("o") }
        
        // wordsWithO = ["room", "home", "heroe"]
    }
    
    func withFiltersManyCondition() {
        
        let words: [String] = ["room", "home", "train", "green", "heroe"]
        
        let worthWithO = words.filter { $0.contains("o") && $0.count >= 5 }
        
        // worthWithO = ["heroe"]
    }
    
    //contains is a higher-order function that allows you to check if there are elements that meet a certain condition and return true or false depending on whether or not they meet it
    //
    //func contains(_ element: Element) -> Bool
    func withContains() {
        let words: String = "room"
        let result = words.contains( "o")
    }
    
    
    //func sorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> [Element]
    func withSorted() {
        let words: [String] = ["room", "home", "train", "green", "heroe"]
        
        let sortedWordsG = words.sorted(by: > )
        
        //sortedWordsG = ["train", "room", "home", "heroe", "green"]
        
        let sortedWordsS = words.sorted(by: < )
        
        //sortedWordsL = ["green", "heroe", "home",  "room",  "train"]
    }
    
    
    
    func withForEach() {
        let words: [String] = ["room", "home", "train", "green", "heroe"]
        words.forEach({ word in
            guard word.count > 4 else {
                print(word.uppercased())
                return
            }
            
            print(word)
        })
        
        ///Greater than 4 print same word else  uppercase word print
        // ROOM
        // HOME
        // train
        // green
        // heroe
    }
    
    
    
    //The higher-order function removeAll(where:) allows us to remove elements from a sequence that meet certain conditions:
    //mutating func removeAll(where shouldBeRemoved: (Element) throws -> Bool) rethrows
    
    func withRemoveAll() {
        var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        numbers.removeAll(where: { $0 % 2 == 0 })
        
        // numbers = [2, 4, 6, 8, 10]
    }
    
    
    
    
    //The first-order functions can be applied consecutively, concatenated. For example, we can take an array containing arrays of numbers and calculate their sum:
    func withConcat() {
        let numbers: [[Int]] = [[1, 3, 6, 2], [2, 5, 7], [1, 3]]
        
        let sum: Int = numbers
            .flatMap({ $0 })
            .reduce(0, {$0 + $1})
        
        // sum = 30
    }
}
