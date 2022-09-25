//
//  FactoryMethod.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 13/09/22.
//

import Foundation


protocol ResourceFactoryProtocol {
    func create() -> String
}

class ProductionResourceFactory: ResourceFactoryProtocol {
    func create() -> String {
        return "http://prodserver"
    }
}

class DevResourceFactory: ResourceFactoryProtocol {
    func create() -> String {
        return "http://devserver"
    }
}

protocol URLFactoryProtocol {
    func create() -> String?
}

class URLFactory: URLFactoryProtocol {
    enum Environment {
        case prod
        case dev
    }
    
    var env: Environment
    
    init(env: Environment) {
        self.env = env
    }
    
    func create() -> String? {
        switch self.env {
        case .prod:
            return ProductionResourceFactory().create()
        case .dev:
            return DevResourceFactory().create()
        }
    }
}
class FactoryPatternTest {
    func testProtocolFactory() {
        let urlFactory = URLFactory(env: .dev)
        print (urlFactory.create())
    }
}
