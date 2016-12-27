//
//  StoreType.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 21/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import Foundation

public protocol StoreType {
    
    associatedtype State: StateType
    associatedtype DispatchCallback = (State) -> Void
    associatedtype ActionCreator = (_ state: State, _ store: StoreType) -> Action?
    associatedtype AsyncActionCreator =
    (_ state: State, _ store: StoreType,
    _ actionCreatorCallback: (ActionCreator) -> Void) -> Void
    
    var state: State! { get }
    var dispatchFunction: DispatchFunction! { get }

    
    init(reducer: @escaping Reducer<State>, state: State?)
    init(reducer: @escaping Reducer<State>, state: State?, middleware: [Middleware])

    func subscribe<S: StoreSubscriber>(_ subscriber: S) where S.StoreSubscriberStateType == State
    func unsubscribe(_ subscriber: AnyStoreSubscriber)
    func dispatch(_ action: Action) -> Any
    func dispatch(_ actionCreator: ActionCreator) -> Any
    func dispatch(_ asyncActionCreator: AsyncActionCreator)
    func dispatch(_ asyncActionCreator: AsyncActionCreator, callback: DispatchCallback?)


}
