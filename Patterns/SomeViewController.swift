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
    weak var viewModel: SomeViewModel! { didSet { unbind(from: oldValue) } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
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

// MARK: - bind/unbind ViewModel method`s

extension SomeViewController {
    private func bind(to viewModel: SomeViewModelOutput) {
        viewModel.observableStr.observe(on: self) { newValue in
            
        }
    }
    
    private func unbind(from item: SomeViewModelOutput?) {
        item?.observableStr.remove(observer: self)
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

