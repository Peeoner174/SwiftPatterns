//
//  Adapter.swift
//  Patterns
//
//  Created by Pavel Kochenda on 02.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

import UIKit

/*
 Позволяет объектам с несовместимыми интерфейсами работать вместе.
 */

struct User {
    enum UserType {
        case individual
        case organization
        case undefined
    }
    
    let userType: UserType
    let phone: String
    let inn: String?
    let fullName: String?
}

class UserAdapter {
    private var dataSet: Dictionary<String, Any>
    private var viewHolder: ViewHolder? {
        didSet {
            guard let vh = self.viewHolder else { return }
            self.onCreateViewHolderBlock(vh)
        }
    }
    let onCreateViewHolderBlock: ((ViewHolder) -> Void)
    
    init(dataSet: Dictionary<String, Any>, onCreateViewHolder: @escaping ((ViewHolder) -> Void)) {
        self.dataSet = dataSet
        self.onCreateViewHolderBlock = onCreateViewHolder
        
        createViewHolder()
    }
    
    private func createViewHolder() {
        guard let userPhone = dataSet["phone"] as? String else {
            self.viewHolder = ViewHolder(SomeUserViewFactory.userDataNotValidError(user: nil))
            return
        }
        
        let userFullName: String? = {
            guard let name = dataSet["name"] else { return nil }
            guard let lastName = dataSet["last_name"] else { return nil }
            return "\(name) \(lastName)"
        }()
        
        let user: User
        if let inn = dataSet["inn"] as? String, (inn.count == 10 || inn.count == 12) {
            user = User(userType: inn.count == 10 ? .individual : .organization, phone: userPhone, inn: inn, fullName: userFullName)
        } else {
            user = User(userType: .undefined, phone: userPhone, inn: nil, fullName: userFullName)
        }
        
        switch user.userType {
        case .individual:
            self.viewHolder = ViewHolder(SomeUserViewFactory.viewForIndividual(user: user))
        case .organization:
            self.viewHolder = ViewHolder(SomeUserViewFactory.viewForOrganization(user: user))
        case .undefined:
            self.viewHolder = ViewHolder(SomeUserViewFactory.userDataNotValidError(user: user))
        }
    }
}

// Just for example
class ViewHolder {
    private var viewController: UIViewController?
    private var view: SomeView?
    private var alertController: UIAlertController?
    
    // ... some metadata ...
    
    init(_ viewController: UIViewController) {
        // TODO
    }
    
    init(_ alertController: UIAlertController) {
        // TODO
    }
    
    init(_ view: SomeView) {
        // TODO
    }
    
    init(_ viewController: UIViewController, _ view: UIView) {
        // TODO
    }
}





