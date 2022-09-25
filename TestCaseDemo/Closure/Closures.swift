//
//  Closures.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 18/09/22.
//

import Foundation


/*
 FUNCTION STARTS WITH "func" KEYWORD CLOSURE DON'T
 FUNCTION ALWAYS HAVE A "name" BUT CLOSURE DON'T
 FUNCTION HAVEN'T "in" KEYWORD
 
 Closure of many type
 DOESNOT ACCEPT PARAMETER AND DOESNOT RETURN
 ACCEPT PARAMETER AND DOESNOT RETURN
 DOESNOT ACCEPT PARAMETER AND RETURN
 ACCEPT PARAMETER AND RETURN
 PASSING CLOSURE INSIDE A FUNCTION LIKE COMPLETION HANDLER
 
 
 
 */
class ClosureTypes {
    let simpleClosure = {
        print("Closure")
    }
    let accptParamClosure:(String) -> () = { name in
        print("Closure \(name)")
    }
    
    let returnWithoutParamClosure:() -> String = {
        return "Closure"
    }
    let takeParamAndReturn:(String) -> String = { name in
        return "Closure \(name)"
    }
    func passingClosureWithCompletionHandler(numbers:[Int], completionHandler:(_ additionOfNumbersUsingClosure:Int) -> Void) {
        var totalNumber = 0
        for number in numbers {
            totalNumber = number+totalNumber
        }
        completionHandler(totalNumber)
    }
    
    func callSimpleClosureCall() {
        simpleClosure()
    }
    func callAccptParamClosure() {
        accptParamClosure("abdur")
    }
    func callReturnClosure() {
        let returnValue = returnWithoutParamClosure()
        print("Closure \(returnValue)")
    }
    func callAccptParamReturnClosure() {
        let returnValue = returnWithoutParamClosure()
        print("Closure \(returnValue)")
    }
    func callCompletionHandler() {
        self.passingClosureWithCompletionHandler(numbers: [10, 10, 10, 8, 6]) { additionOfNumbersUsingClosure in
            print(additionOfNumbersUsingClosure)
        }
    }
}
class Closures {
    
    //Closure for add with parameter name
    let add: (Int, Int) -> Int = { (num1,num2) in
        return num1+num2
    }
    //Closure for add with out parameter name
    let addWithoutName: (Int, Int) -> Int = {
        return $0+$1
    }
    //Closure for substract with parameter name
    let sub: (Int, Int) -> Int = { (num1,num2) in
        return num1-num2
    }
    //Closure for substract without parameter name
    let subWithoutName: (Int, Int) -> Int = {
        return $0-$1
    }
    
    
    
    
func add(num1:Int, num2:Int) -> Int {
    return num1+num2
}
func nonEscapingClosure() {
    //CLOSURE USING ARRAY
    let arrayClosure = [add, subWithoutName]
    let addFunc = arrayClosure[0]
    let addResult = addFunc(5,7)
    let subFunc = arrayClosure[1]
    let subResult = subFunc(10,3)
    
    //CLOSURE USING DICTIONARY
    let dicClosure = ["add" :add,
                      "sub" :subWithoutName]
    let dicFunc = dicClosure["add"]!
    let adResult = dicFunc(5,7)
    let dicFunc1 = dicClosure["sub"]!
    let subResult1 = dicFunc1(10,3)
}
    
    
}
