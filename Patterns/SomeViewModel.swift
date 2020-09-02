//
//  SomeViewModel.swift
//  Patterns
//
//  Created by Pavel Kochenda on 02.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

protocol SomeViewModelOutput {
    var observableStr: Observable<String> { get }
}

protocol SomeViewModelInput {
    // some method`s
}

class SomeViewModel: SomeViewModelOutput, SomeViewModelInput {
    var observableStr: Observable<String> = Observable("")
}
