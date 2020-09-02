//
//  Delegate.swift
//  Patterns
//
//  Created by MSI on 01.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

import UIKit

/*
 Объект внешне выражает некоторое поведение, но в реальности передаёт ответственность за выполнение этого поведения связанному объекту
 */

protocol ViewControllerDelegate: class {
    func viewControllerBeginAtive(_ viewController: UIViewController)
    func viewControllerBeginInactive(_ viewController: UIViewController, sayHelloWorld: String)
}

