//
//  Decorator.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 13/09/22.
//


/*
 The decorator pattern dynamically modifies the behavior of a core object without changing its existing class definition.
The decorator pattern has two primary components: a core object that will have its behavior modified, and a decorator object that brings about the changed behavior in the core object.
These two components work together for two primary goals:
Behavior Modification
… Achieved Dynamically
 */


import Foundation
protocol Transporting {
  func getSpeed() -> Double
  func getTraction() -> Double
}

// Core Component
final class RaceCar: Transporting {
  private let speed = 10.0
  private let traction = 10.0
  
  func getSpeed() -> Double {
    return speed
  }
  
  func getTraction() -> Double {
    return traction
  }
}




// Abstract Decorator
class TireDecorator: Transporting {
  // 1
  private let transportable: Transporting
  
  init(transportable: Transporting) {
    self.transportable = transportable
  }
  
  // 2
  func getSpeed() -> Double {
    return transportable.getSpeed()
  }
  
  func getTraction() -> Double {
    return transportable.getTraction()
  }
}

class OffRoadTireDecorator: Transporting {
  private let transportable: Transporting
  
  init(transportable: Transporting) {
    self.transportable = transportable
  }
  
  func getSpeed() -> Double {
    return transportable.getSpeed() - 3.0
  }
  
  func getTraction() -> Double {
    return transportable.getTraction() + 3.0
  }
}


class ChainedTireDecorator: Transporting {
  private let transportable: Transporting
  
  init(transportable: Transporting) {
    self.transportable = transportable
  }
  
  func getSpeed() -> Double {
    return transportable.getSpeed() - 1.0
  }
  
  func getTraction() -> Double {
    return transportable.getTraction() * 1.1
  }
}





class TestDecorator {
    func testDecorator() {
        let raceCar = RaceCar()
        let defaultSpeed = raceCar.getSpeed()
        let defaultTraction = raceCar.getTraction()
    }
    
    func testDecoratorInItsWay() {
        // Create Race Car
        let defaultRaceCar = RaceCar()
        defaultRaceCar.getSpeed() // 10
        defaultRaceCar.getTraction() // 10

        // Modify Race Car
        let offRoadRaceCar = OffRoadTireDecorator(transportable: defaultRaceCar)
        offRoadRaceCar.getSpeed() // 7
        offRoadRaceCar.getTraction() // 13
    }
    
    func testChainDecorator() {
        // Double Decorators
        let defaultRaceCar = RaceCar()
        let offRoadRaceCar = OffRoadTireDecorator(transportable: defaultRaceCar)
        let chainedTiresRaceCar = ChainedTireDecorator(transportable: offRoadRaceCar)
        chainedTiresRaceCar.getSpeed() // 6
        chainedTiresRaceCar.getTraction() // 14.3
    }
}
