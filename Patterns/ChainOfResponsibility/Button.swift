//
//  Button.swift
//  Patterns
//
//  Created by Pavel Kochenda on 02.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

import UIKit

typealias TapActionBlock = (() -> Void)?

class Button: UIButton, UserInteractionHandler {
    var nextHandler: UserInteractionHandler?
    lazy var userInterationHandlerView: UIView = (self.nextHandler ?? self) as! UIView

    func handle(controlEvents: UIControl.Event) {
        guard let nextHandler = nextHandler else {
            if controlEvents == .touchUpInside { tapActionBlock?() }
            return
        }
        nextHandler.handle(controlEvents: controlEvents)
    }
    
    var tapActionBlock: TapActionBlock = nil
}

// MARK: - Actions

extension Button {
    
    override func sendActions(for controlEvents: UIControl.Event) {
        super.sendActions(for: controlEvents)
        self.handle(controlEvents: controlEvents)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        normalScale()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        normalScale()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        smallScale()
    }
}

// MARK: Animations

extension Button {
    
    func smallScale() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            self.userInterationHandlerView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
    }
    
    func normalScale() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            self.userInterationHandlerView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
}



