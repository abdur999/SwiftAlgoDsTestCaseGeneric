//
//  SingleTon.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 13/09/22.
//

import Foundation

/// The Singleton class defines the `shared` field that lets clients access the
/// unique singleton instance.
class Singleton {

    /// The static field that controls the access to the singleton instance.
    ///
    /// This implementation let you extend the Singleton class while keeping
    /// just one instance of each subclass around.
    static var shared: Singleton = {
        let instance = Singleton()
        // ... configure the instance
        // ...
        return instance
    }()

    /// The Singleton's initializer should always be private to prevent direct
    /// construction calls with the `new` operator.
    private init() {}

    /// Finally, any singleton should define some business logic, which can be
    /// executed on its instance.
    func someBusinessLogic() -> String {
        // ...
        return "Result of the 'someBusinessLogic' call"
    }
}

class TestSingleton {
    func testSingleton() {
        Singleton.shared.someBusinessLogic()
    }
}


// Dependency Injection
// Even if you decide to use singletons in a project, that doesn't mean you have to access them from anywhere in your project.
// You can still use dependency injection to pass the singleton object to the objects that need it.
// By adopting dependency injection to pass singletons around, the interface of your class remains clear and transparent.
// In other words, the interface of the class describes its dependencies.
// This is very, very useful. It immediately shows which objects the class needs to perform its duties.
