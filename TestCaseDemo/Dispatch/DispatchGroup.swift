//
//  DispatchGroup.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 08/09/22.
//

import Foundation
class DispatchGropClass {
    func performUsingGroup() {
        let dq1 = DispatchQueue(label: "q1", attributes: .concurrent)
        let dq2 = DispatchQueue(label: "q2", attributes: .concurrent)
        let group = DispatchGroup()
        
        for i in 1...3 {
            group.enter()
            dq1.async {
                print("\(#function) DispatchQueue 1: \(i)")
                group.leave()
            }
        }
        for i in 1...3 {
            group.enter()
            dq2.async {
                print("\(#function) DispatchQueue 2: \(i)")
                group.leave()
            }
        }
        
        group.notify(queue: DispatchQueue.main) {
            print("done by group")
        }
    }
    
    func callFunction() {
        performUsingGroup()
        RunLoop.current.run(mode: RunLoop.Mode.default,  before: Date(timeIntervalSinceNow: 1))
    }
}
