//
//  Singleton.swift
//  Patterns
//
//  Created by MSI on 01.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

/*
 Гарантирует, что у класса есть только один экземпляр, и предоставляет к нему глобальную точку доступа.
 */

import Foundation

class Singleton {
    
    private init() {}
    
    static let shared = Singleton()
}
