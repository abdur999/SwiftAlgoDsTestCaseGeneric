//
//  DependencyInversionPrinciple.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 08/09/22.
//

import Foundation

//DependencyInversionPrinciple not implemented here



/*
class NSFileSystemManager {
    func save(string: String) {
        // Open a file
        // Save the string in this file
        // Close the file
   }
}
class NSHandler {
    let fileManager = NSFileSystemManager()
    func handle(string: String) {
        fileManager.save(string: string)
    }
}
 */


//DependencyInversionPrinciple not implemented here
/*
 High-level modules, which provide complex logic, should be easily reusable and unaffected by changes in low-level modules, which provide utility features. To achieve that, you need to introduce an abstraction that decouples the high-level and low-level modules from each other.
 
 1. High-level modules should not depend on low-level modules. Both should depend on abstractions.
 2. Abstractions should not depend on details. Details should depend on abstractions.
 
 */
protocol Storage {
    func save(string: String)
}
class FileSystemManager: Storage {
    func save(string: String) {
        // Open a file in read-mode
        // Save the string in this file
        // Close the file
    }
}
class DatabaseManager: Storage {
    func save(string: String) {
        // Connect to the database
        // Execute the query to save the string in a table
        // Close the connection
    }
}
class Handler {
    let storage: Storage
    // Storage types
    init(storage: Storage) {
        self.storage = storage
    }
    
    func handle(string: String) {
        storage.save(string: string)
    }
}
