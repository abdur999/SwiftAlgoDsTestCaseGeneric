//
//  AppDelegate.swift
//  TestCaseDemo
//
//  Created by CodeCat15 on 12/24/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func solve(_ A : inout [Int], _ B: inout Int) -> Int {
        var i = 0
        var count = 0
        for  i  in stride(from: i, to: B, by: 1) {
            var j = i+1
            for  j  in stride(from: j, to: B, by: 1) {
                if A[i] == A[j] {
                    count += 1
                  break
                }
            }
            
        }
        return count
    }

    func solveX(_ A: inout [Int]) -> Int {
        var maxEven = 0
        var maxOdd = 0
        var i = 0
        for  i  in stride(from: i, to: A.count, by: 1) {
            if A[i] != 0 {
                if A[i] % 2 == 0 && A[i] > maxEven {
                    maxEven = A[i]
                }
                if A[i] % 2 != 0 && A[i] > maxOdd {
                    maxOdd = A[i]
                }
            }
        }
        return maxEven - maxOdd
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let testLeak = TestMLealk()
        testLeak.getCatMLeak()
        testLeak.getCatMLeakFree()
        
        //CLOSURE CALLBACK
        let closure = ClosureTypes()
        closure.callSimpleClosureCall()
        closure.callAccptParamClosure()
        closure.callReturnClosure()
        closure.callAccptParamReturnClosure()
        closure.callCompletionHandler()
        
        var intArr = [1,2,3,4,6,7,8,1,2,3,100]
        var items = 11
        let count = solve(&intArr, &items)
        print(count)
        let diff = solveX(&intArr)
        print("diff is \(diff)")
        let customConvert = CustomConvert()
        customConvert.callOpaqueType()
        customConvert.callCutomConvert()
       
        let execSort = ExecuteQuickSort()
        execSort.executeQickSort()
        execSort.executeQickSortHoare()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

