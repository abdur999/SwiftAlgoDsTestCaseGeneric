//
//  AbstarctFactoryMethod.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 13/09/22.
//

import Foundation

//ABSTRACT FACTORY
protocol Button {
    func setTitle(_ title: String) -> Void
    func show() -> Void
}

protocol Window {
    func setTitle(_ title: String) -> Void
    func show() -> Void
}

class WinButton: Button {
    var title: String?
    
    func setTitle(_ title: String) -> Void {
        self.title = title
    }
    
    func show() -> Void {
        print("Showing Windows style button [Title: \(self.title!)]")
    }
}

class WinWindow : Window {
    var title: String?
    
    func setTitle(_ title: String) -> Void {
        self.title = title
    }
    
    func show() -> Void {
        print("Showing Windows style window [Title: \(self.title!)]")
    }
}

class OSXButton : Button {
    var title: String?
    
    func setTitle(_ title: String) -> Void {
        self.title = title
    }
    
    func show() -> Void {
        print("Showing OSX style button [Title: \(self.title!)]")
    }
}

class OSXWindow : Window {
    var title: String?
    
    func setTitle(_ title: String) -> Void {
        self.title = title
    }

    func show() -> Void {
        print("Showing OSX style window [Title: \(self.title!)]")
    }
}


protocol AbstractGUIFactory {
    func createButton() -> Button
    func createWindow() -> Window
}

class WinFactory : AbstractGUIFactory {
    func createButton() -> Button {
        return WinButton()
    }
    
    func createWindow() -> Window {
        return WinWindow()
    }
}

class OSXFactory : AbstractGUIFactory {
    func createButton() -> Button {
        return OSXButton()
    }
    
    func createWindow() -> Window {
        return OSXWindow()
    }
}

class GUIBuilder {
    private var platform: String
    private var guiFactory: AbstractGUIFactory?
    
    init(platform: String) {
        self.platform = platform
    }
    
    func initGuiFactory() -> Void {
        if nil != guiFactory { return }
        if platform == "Windows" { guiFactory = WinFactory() }
        else { guiFactory = OSXFactory() }
    }
    
    func buildButton() -> Button {
        initGuiFactory()
        return guiFactory!.createButton()
    }
    
    func buildWindow() -> Window {
        initGuiFactory()
        return guiFactory!.createWindow()
    }
}


// service protocols
protocol ServiceFactory {
    func create() -> Service
}

protocol Service {
    var url: URL { get }
}



//ABSTRACT FACTORY 2
// staging
class StagingService: Service {
    var url: URL { return URL(string: "https://dev.localhost/")! }
}

class StagingServiceFactory: ServiceFactory {
    func create() -> Service {
        return StagingService()
    }
}

// production
class ProductionService: Service {
    var url: URL { return URL(string: "https://live.localhost/")! }
}

class ProductionServiceFactory: ServiceFactory {
    func create() -> Service {
        return ProductionService()
    }
}

// abstract factory
class AppServiceFactory: ServiceFactory {

    enum Environment {
        case production
        case staging
    }

    var env: Environment

    init(env: Environment) {
        self.env = env
    }

    func create() -> Service {
        switch self.env {
        case .production:
            return ProductionServiceFactory().create()
        case .staging:
            return StagingServiceFactory().create()
        }
    }
}



class AbstarctFactoryTest {
    func testAbstractFactory() {
        let guiBuilder: GUIBuilder = GUIBuilder(platform: "Windows") // little bit complicated due to pass String
        
        let window: Window = guiBuilder.buildWindow()
        window.setTitle("Mahbub")
        window.show()
        
        let button: Button = guiBuilder.buildButton()
        button.setTitle("Connect")
        button.show()
    }
    
    func testAbstractFactory2() {
        let factory = AppServiceFactory(env: .production) //either stagging or producation enum value
        let service = factory.create()
        print(service.url)
    }
}
