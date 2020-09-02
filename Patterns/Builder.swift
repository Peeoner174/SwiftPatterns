//
//  Builder.swift
//  Patterns
//
//  Created by Pavel Kochenda on 02.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

import UIKit

/*
 Позволяет создавать сложные объекты пошагово. Строитель даёт возможность использовать один и тот же код строительства для получения разных представлений объектов.
 */

class SomeViewBuilder {
    private var nodes: [SomeViewNode & UIView] = []
    
    func add(node: SomeViewNode & UIView) -> SomeViewBuilder {
        nodes.append(node)
        return self
    }
    
    func build() -> SomeView {
        return SomeView(nodes: nodes)
    }
}

protocol SomeViewNode {
}

class SomeView: UIView {
    private weak var stackView: UIStackView!
    
    init(nodes: [SomeViewNode & UIView]) {
        super.init(frame: .zero)
        
        createStackView()
        for node in nodes {
            self.stackView.addArrangedSubview(node)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func createStackView() {
        let stack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 8.0
            return stack
        }()
        
        addSubview(stack)
        stack.fillSuperview()
        
        self.stackView = stack
    }
}

class CommonViewNode: UIView, SomeViewNode {
    // TODO
}

class IndividualUserViewNode: UIView, SomeViewNode {
    
    init(user: User) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // TODO
}

class OrganizationViewNode: UIView, SomeViewNode {
    
    init(user: User) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // TODO
}


