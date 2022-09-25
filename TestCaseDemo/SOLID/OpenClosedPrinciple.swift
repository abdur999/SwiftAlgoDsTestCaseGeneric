//
//  OpenClosedPrinciple.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 08/09/22.
//

import Foundation

//THIS CODE IS NOT SATISFIED OPENCLOASE PRINCIPLE SO ITS COMMENTED

/*
//Not SatisFied Car
class NSCar {
    let name: String
    let color: String
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
   func printDetails() -> String {
        return "I have \(self.color) color \(self.name)."
    }
}
//Not SatisFied Bike
class NSBike {
    let name: String
    let color: String
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    func printDetails() -> String {
        return "I have \(self.name) bike of color \(self.color)."
    }
}
//Not SatisFied Logger
class NSLogger {
    func printData() {
            let cars = [ Car(name: "BMW", color: "Red"),
                         Car(name: "Audi", color: "Black")]
             cars.forEach { car in
                 print(car.printDetails())
             }
            let bikes = [ Bike(name: "Homda CBR", color: "Black"),
                          Bike(name: "Triumph", color: "White")]
            bikes.forEach { bike in
                 print(bike.printDetails())
             }
         }
} */


//THIS CODE IS SATISFIED OPENCLOASE PRINCIPLE
protocol Printable {
    func printDetails() -> String
}
class Car: Printable {
    let name: String
    let color: String
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    func printDetails() -> String {
        return "I have \(self.color) color \(self.name)."
    }
}
class Bike: Printable {
    let name: String
    let color: String
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    func printDetails() -> String {
        return "I have \(self.name) bike of color \(self.color)."
    }
}
class Logger {
    func printData() {
        let vehicles: [Printable] = [Car(name: "BMW", color: "Red"),
                                  Car(name: "Audi", color: "Black"),
                            Bike(name: "Honda CBR", color: "Black"),
                              Bike(name: "Triumph", color: "White")]
        vehicles.forEach { vehicle in
            print(vehicle.printDetails())
        }
    }
}
