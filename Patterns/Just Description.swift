//
//  Prototype.swift
//  Patterns
//
//  Created by Pavel Kochenda on 04.09.2020.
//  Copyright © 2020 MSI. All rights reserved.
//

/*
 Прототип — это порождающий паттерн проектирования, который позволяет копировать объекты, не вдаваясь в подробности их реализации.
 
 Протокол NSCopying реализует паттерн.
 */

/*
 Decorator - Позволяет динамически добавлять объектам новую функциональность, оборачивая их в полезные «обёртки».
 
 Отличный пример - это операторы в реактивном программировании.
 */

/*
 Flyweight - Позволяет вместить бóльшее количество объектов в отведённую оперативную память. Легковес экономит память, разделяя общее состояние объектов между собой, вместо хранения одинаковых данных в каждом объекте.
 
 В качестве примера ARC Side Table. Это Хеш-таблица, в качестве ключа в ней используется хэшированный адрес объекта.
 * Во-первых это сокращает размер памяти, который требуется для каждого объекта, так как часть метаданных о нем хранится во внешнем хранилище, а объект лишь содержит ссылку на нее.
 * Во-вторых слабая ссылка в swift ссылается на соответствующий элемент в хэш-таблице, а не на сам объект. Такой подход устраняет проблему возникновения зомби-объектов(ситуация, когда формально объект уже недоступен из кода программы, но память, которую он занимает еще не освобожденна: tiny.cc/10trsz )
 */

/*
Proxy - Позволяет подставлять вместо реальных объектов специальные объекты-заменители. Эти объекты перехватывают вызовы к оригинальному объекту, позволяя сделать что-то до или после передачи вызова оригиналу.
 
 Простейший пример это стандартные методы didSet { } willSet { } get { } set { } у свойств класса
*/

/*
Command - превращает запросы в объекты, позволяя передавать их как аргументы при вызове методов, ставить запросы в очередь, логировать их, а также поддерживать отмену операций.
 
 Например:
    DispatchWorkItem -- блок кода, который можно добавить в очередь(DispatchQueue). Может быть представлен в виде сущности класса или в виде замыкания. Как сущность класса предоставляет интерфейсы управления.
*/

/*
Momento -- Позволяет делать снимки состояния объектов, не раскрывая подробностей их реализации. Затем снимки можно использовать, чтобы восстановить прошлое состояние объектов.
 
 Как пример, это сериализация объекта
*/

/*
 State -- Позволяет объектам менять поведение в зависимости от своего состояния. Извне создаётся впечатление, что изменился класс объекта.
 
Пример
Класс, описывающий анимацию. Он имеет свойства transitionType. При переключении состояния transitionType меняется стиль анимации.
 
https://github.com/Peeoner174/CleanArhitecture/blob/master/CleanArhitecture/Source/CoreLayer/Popover/Animator/SlideAnimator.swift
 */

/*
Strategy -- Определяет семейство схожих алгоритмов и помещает каждый из них в собственный класс, после чего алгоритмы можно взаимозаменять прямо во время исполнения программы.
 
 Рассмотрим реализацию Popover в данном проекте.
 https://github.com/Peeoner174/CleanArhitecture/blob/master/CleanArhitecture/Source/CoreLayer/Popover/
 Анимация в нем представлена как отдельная сущность с несколькими состояниями. Вся требуемая логика работы описана в протоколах.
 Такой подход позволяет легко создавать различные стили анимаций с возможностью менять их "на лету"
*/



