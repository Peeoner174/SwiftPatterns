//
//  SomeViewModel.swift
//  Patterns
//
//  Created by Pavel Kochenda on 02.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

/*
Bridge -- разделяет один или несколько классов на две отдельные иерархии — абстракцию и реализацию, позволяя изменять их независимо друг от друга.
 
В качестве примера рассмотрим протоколы между сущностями модуля в Presentation Layer. Это стандартный шаблон связи в VIPER и MVP архитектуре
 
 НазваниеМодуляInput  -- Список свойств(property), которые сущность может предоставить связанному объекту.
 НазваниеМодуляOutput -- Список команд(методов), которые могут поступать от связанной сущности. Например View может запросить список городов у ViewModel
 
 Кроме информации, описанной в протоколах, связанные сущности ничего друг о друге не знают(тип связей определяется архитектурой). Это позволяет подменять реализацию функционала "на лету", а также упрощает понимание кодовой базы проекта.
 */

protocol SomeViewModelOutput {
    var observableStr: Observable<String> { get }
}

protocol SomeViewModelInput {
    // some method`s
}

class SomeViewModel: SomeViewModelOutput, SomeViewModelInput {
    var observableStr: Observable<String> = Observable("")
}
