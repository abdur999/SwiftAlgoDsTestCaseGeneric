//
//  DispatchSemaphore.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 08/09/22.
//

import Foundation

class DispatchSemaphoreClass {
    
    func performUsingSemaphore() {
        let dq1 = DispatchQueue(label: "q1", attributes: .concurrent)
        let dq2 = DispatchQueue(label: "q2", attributes: .concurrent)
        let semaphore = DispatchSemaphore(value: 1)
        
        for i in 1...3 {
            dq1.async {
                _ = semaphore.wait(timeout: DispatchTime.distantFuture)
                print("\(#function) DispatchQueue 1: \(i)")
                semaphore.signal()
            }
        }
        for i in 1...3 {
            dq2.async {
                _ = semaphore.wait(timeout: DispatchTime.distantFuture)
                print("\(#function) DispatchQueue 2: \(i)")
                semaphore.signal()
            }
        }
    }
    func callFunction() {
        performUsingSemaphore()
        RunLoop.current.run(mode: RunLoop.Mode.default,  before: Date(timeIntervalSinceNow: 1))
    }
    
}
