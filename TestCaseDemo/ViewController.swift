//
//  ViewController.swift
//  TestCaseDemo
//
//  Created by CodeCat15 on 12/24/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func moveToCollection(_ sender: Any) {
        navigationController?.pushViewController(CollectionViewController(), animated: true)
    }
    @IBAction func memoryTest(_ sender: Any) {
        navigationController?.pushViewController(MemoryLeakController(), animated: true)
    }
    

}
