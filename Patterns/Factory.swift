//
//  Fabric.swift
//  Patterns
//
//  Created by Pavel Kochenda on 02.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

import UIKit

class SomeUserViewFactory {
    static func viewForIndividual(user: User) -> SomeView {
        return SomeViewBuilder()
            .add(node: IndividualUserViewNode(user: user))
            .add(node: CommonViewNode())
            .build()
    }
    
    static func viewForOrganization(user: User) -> SomeView {
        return SomeViewBuilder()
            .add(node: IndividualUserViewNode(user: user))
            .add(node: CommonViewNode())
            .build()
    }
    
    static func userDataNotValidError(user: User?) -> UIAlertController {
        guard let _ = user else {
            return UIAlertController(title: "Ошибка", message: "Пользователь не найден", preferredStyle: .alert)
        }
        return UIAlertController(title: "Внимание", message: "ИНН не валиден", preferredStyle: .alert)
    }
}

