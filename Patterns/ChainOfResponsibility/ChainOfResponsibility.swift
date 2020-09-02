//
//  ChainOfResponsibility.swift
//  Patterns
//
//  Created by Pavel Kochenda on 02.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

/*
 Позволяет передавать запросы последовательно по цепочке обработчиков. Каждый последующий обработчик решает, может ли он обработать запрос сам и стоит ли передавать запрос дальше по цепи.
 */

import UIKit

protocol UserInteractionHandler: UIResponder {
    @discardableResult
    func setNext(handler: UserInteractionHandler) -> UserInteractionHandler
    
    var nextHandler: UserInteractionHandler? { get set }
    
    func handle(controlEvents: UIControl.Event)
}

extension UserInteractionHandler {
    
    @discardableResult
    func setNext(handler: UserInteractionHandler) -> UserInteractionHandler {
        self.nextHandler = handler
        return handler
    }
}

