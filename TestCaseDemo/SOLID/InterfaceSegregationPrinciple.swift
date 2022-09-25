//
//  InterfaceSegregationPrinciple.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 08/09/22.
//

import Foundation


//THIS CODE IS NOT SATISFIED INTERFACE SEGRIGRATION PRINCIPLE SO ITS COMMENTED
//WE HAVE TO IMPLEMENT BELOW CODE INSTEAD OF TOP CODE, AS TOP CODE NOT SATISFIED INTERFACE SEGRIGRATION


/*
//After some time, you have to add more gestures to the protocol
protocol GestureProtocol {
    func didTap()
    func didDoubleTap()
    func didLongPress()
}

class NSSuperButton: GestureProtocol {
    func didTap() {
        // Single tap operation
    }
    func didDoubleTap() {
        // double tap operation
    }
    func didLongPress() {
        // long press operation
    }
}
//But if implement Double Tab Button it implement all the action
class NSDoubleTapButton: GestureProtocol {
    func didTap() {
        // Single tap operation
    }
    func didDoubleTap() {
        // double tap operation
    }
    func didLongPress() {
        // long press operation
    }
}
 */

//THIS CODE IS NOT SATISFIED INTERFACE SEGRIGRATION PRINCIPLE SO ITS COMMENTED

protocol TapProtocol {
    func didTap()
}
protocol DoubleTapProtocol {
    func didDoubleTap()
}
protocol LongPressProtocol {
    func didLongPress()
}
class SuperButton: TapProtocol, DoubleTapProtocol, LongPressProtocol {
    func didTap() {
        // Single tap operation
    }
func didDoubleTap() {
        // double tap operation
    }
func didLongPress() {
        // long press operation
    }
}
class DoubleTapButton: DoubleTapProtocol {
    func didDoubleTap() {
        // double tap operation
    }
}
