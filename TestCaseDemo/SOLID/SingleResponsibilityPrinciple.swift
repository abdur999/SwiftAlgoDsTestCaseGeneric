//
//  SingleResponsibilityPrinciple.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 08/09/22.
//

import Foundation

//THIS MODULE DOES NOT MAINTAIN SINGELERESPONSIBILITY PRINCIPLE
// It doesnot maintain any seperate module for every work instead it's use function for do the same

/*class Handler {
    
    func handle() {
        let data = requestDataToAPI()
        let array = parse(data: data)
        saveToDatabase(array: array)
    }
  
    private func requestDataToAPI() -> Data {
        // Network request and wait the response
        return Data.init()
    }
    
    private func parseResponse(data: Data) -> [String] {
        // Parse the network response into array
 return []
    }
   
    private func saveToDatabase(array: [String]) {
        // Save parsed response into database
    }
}*/


//THIS MODULE MAINTAIN SINGELERESPONSIBILITY PRINCIPLE
// It's maintain seperate module for every work instead it's use function for do the same
class SingleResponsibilityHandler {
    let apiHandler: NetworkHandler
    let parseHandler: ResponseHandler
    let databaseHandler: DatabaseHandler
    init(apiHandler: NetworkHandler, parseHandler: ResponseHandler, dbHandler: DatabaseHandler) {
        self.apiHandler = apiHandler
        self.parseHandler = parseHandler
        self.databaseHandler = dbHandler
    }
    func handle() {
        let data = apiHandler.requestDataToAPI()
        let array = parseHandler.parseResponse(data: data)
        databaseHandler.saveToDatabase(array: array)
    }
}
class NetworkHandler {
    func requestDataToAPI() -> Data {
        // Network request and wait the response
        return Data.init()
    }
}
class ResponseHandler {
    func parseResponse(data: Data) -> [String] {
        // Parse the network response into array
        return []
    }
}
class DatabaseHandler {
    func saveToDatabase(array: [String]) {
        // Save parsed response into database
    }
}

