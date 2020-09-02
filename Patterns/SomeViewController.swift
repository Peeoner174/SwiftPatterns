//
//  ViewController.swift
//  Patterns
//
//  Created by MSI on 01.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

import UIKit

class SomeViewController: UIViewController {
    weak var delegate: SomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delegate?.viewControllerBeginAtive(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.viewControllerBeginInactive(self, sayHelloWorld: "Hello World")
    }
}

class SomeViewControllerDelegate: ViewControllerDelegate {
    func viewControllerBeginAtive(_ viewController: UIViewController) {
        print("\(#function) is called")
    }
    
    func viewControllerBeginInactive(_ viewController: UIViewController, sayHelloWorld: String) {
        print("\(#function) is called and i say \(sayHelloWorld)")
    }
}

