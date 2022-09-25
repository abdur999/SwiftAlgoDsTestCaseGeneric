//
//  MemoryLeakController.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 18/09/22.
//

import UIKit

class MemoryLeakController: UIViewController {
    
    lazy var button: UIButton = {

        let button = UIButton(type: .system)

        button.setTitle("Navigate", for: .normal)

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false

        return button

    }()

    

    override func viewDidLoad() {

        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(button)

        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }

    

    @objc func buttonTapped() {

        navigationController?.pushViewController(SecondViewController(), animated: true)

    }

}

class SecondViewController: UIViewController {

    let server = ServerMM()

    

    override func viewDidLoad() {

        super.viewDidLoad()

        view.backgroundColor = .cyan

        server.add(client: ClientMM(server: server))

    }

    

    deinit {

        print("\(Self.self) object was deallocated")

    }

}


class ClientMM {

    var server: ServerMM




    init (server: ServerMM) {

        self.server = server

        server.add(client: self) // memory leak

    }

    

    deinit {

        print("\(Self.self) object was deallocated")

    }

}

//MARK: MEMORY NOT CLEARED
class ServerMM {

    var clients: [ClientMM] = []

    func add(client: ClientMM) {

        clients.append(client)

    }

    

    deinit {

        print("\(Self.self) object was deallocated")

    }

}

 
class ServerMNM {

    var clients: [ClientMNM] = []

    func add(client: ClientMNM) {

        clients.append(client)

    }

    

    deinit {

        print("\(Self.self) object was deallocated")

    }

}

//MARK: MEMORY CLEARED
class ClientMNM {

//    var server: ServerMNM  Reason for memory leak
    
    unowned var server: ServerMNM




    init (server: ServerMNM) {

        self.server = server

        server.add(client: self)

    }

    

    deinit {

        print("\(Self.self) object was deallocated")

    }
}

class CatMLeak {

    var name: String

    var owner: OwnerMLeak?

    

    init(name: String, owner: OwnerMLeak? = nil) {

        self.name = name

        self.owner = owner

        print("\(Self.self) object initialized")

    }




    deinit {

        print("\(Self.self) object was deallocated")

    }

}




class OwnerMLeak {

    var name: String

    var cat: CatMLeak?




    init(name: String, cat: CatMLeak? = nil) {

        self.name = name

        self.cat = cat

        print("\(Self.self) object initialized")

    }

    

    deinit {

        print("\(Self.self) object was deallocated")

    }

}

class CatMLeakFree {

    var name: String

    var owner: OwnerMLeakFree?

    

    init(name: String, owner: OwnerMLeakFree? = nil) {

        self.name = name

        self.owner = owner

        print("\(Self.self) object initialized")

    }




    deinit {

        print("\(Self.self) object was deallocated")

    }

}

class OwnerMLeakFree {

    var name: String

    unowned var cat: CatMLeakFree?
//  weak var cat: CatMLeak?



    init(name: String, cat: CatMLeakFree? = nil) {

        self.name = name

        self.cat = cat

        print("\(Self.self) object initialized")

    }

    

    deinit {

        print("\(Self.self) object was deallocated")

    }

}
class TestMLealk {
    func getCatMLeak() {
    var cat: CatMLeak? = CatMLeak(name: "Fred")

    var owner: OwnerMLeak? = OwnerMLeak(name: "Vitor", cat: cat)
    cat?.owner = owner

    cat = nil
    owner = nil
    //Cat object initialized
    //Owner object initialized
    }
    
    func getCatMLeakFree() {
        var cat: CatMLeakFree? = CatMLeakFree(name: "Fred")

        var owner: OwnerMLeakFree? = OwnerMLeakFree(name: "Vitor", cat: cat)
        cat?.owner = owner

        cat = nil

        owner = nil

        //Cat object initialized

        //Owner object initialized

        //Cat object was deallocated

        //Owner object was deallocated

    }
}

