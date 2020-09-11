//
//  Style.swift
//  Patterns
//
//  Created by Pavel Kochenda on 11.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

import Foundation
import UIKit

struct Styles {
    static var fontNormal: Decoration<UILabel> {
        return { (label: UILabel) -> Void in
            label.font = .systemFont(ofSize: 15.0)
        }
    }
    
    static func corners(rounded: Bool) -> Decoration<UIView> {
        return { (view: UIView) -> Void in
            switch rounded {
            case true:
                let mask = CAShapeLayer()
                let size = CGSize(width: 10, height: 10)
                let rect = view.bounds
                let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: size)
                mask.path = path.cgPath
                view.layer.mask = mask
            default:
                view.layer.mask = nil
            }
        }
    }
}
