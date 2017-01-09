//
//  Store.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 21/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import Foundation

open class Store<State: StateType>: StoreType {
    
                typealias SubscriptionType = Subscription<State>
    public      typealias DispatchCallback = (State) -> Void
    public      typealias ActionCreator = (_ state: State, _ store: Store) -> Action?
    public      typealias AsyncActionCreator = (
        _ state: State,
        _ store: Store,
        _ actionCreatorCallback: @escaping ((ActionCreator) -> Void)
        ) -> Void
    
    
           var subscriptions: [SubscriptionType] = []
    public var dispatchFunction: DispatchFunction!
    public var state: State! {
        didSet {
            subscriptions = subscriptions.filter { $0.subscriber != nil }
            subscriptions.forEach {
                $0.subscriber?._newState(state: $0.selector?(state) ?? state)
            }
        }
    }
    
    private var reducer: Reducer<State>
    private var isDispatching = false

 
    
    public required convenience init(reducer: @escaping Reducer<State>, state: State?) {
        self.init(reducer: reducer, state: state, middleware: [])
    }
    
    public required init(
        reducer: @escaping Reducer<State>,
        state: State?,
        middleware: [Middleware]
        ) {
        self.reducer = reducer
        
        self.dispatchFunction = middleware
            .reversed()
            .reduce({ [unowned self] action in
                return self._defaultDispatch(action: action)
            }) {
                [weak self] dispatchFunction, middleware in
                let getState = { self?.state }
                return middleware(self?.dispatch, getState)(dispatchFunction)
        }
        
        if let state = state {
            self.state = state
        } else {
            dispatch(ReSwiftInit())
        }
    }
    
    private func _isNewSubscriber(subscriber: AnyStoreSubscriber) -> Bool {
        let contains = subscriptions.contains(where: { $0.subscriber === subscriber })
        
        if contains {
            print("Store subscriber is already added, ignoring.")
            return false
        }
        return true
    }
    
    open func subscribe<S: StoreSubscriber>(_ subscriber: S)
        where S.StoreSubscriberStateType == State {
            subscribe(subscriber, selector: nil)
    }
    
    open func subscribe<SelectedState, S: StoreSubscriber>
        (_ subscriber: S, selector: ((State) -> SelectedState)?)
        where S.StoreSubscriberStateType == SelectedState {
            if !_isNewSubscriber(subscriber: subscriber) { return }
            
            subscriptions.append(Subscription(subscriber: subscriber, selector: selector))
            
            if let state = self.state {
                subscriber._newState(state: selector?(state) ?? state)
            }
    }
    
    open func unsubscribe(_ subscriber: AnyStoreSubscriber) {
        if let index = subscriptions.index(where: { return $0.subscriber === subscriber }) {
            subscriptions.remove(at: index)
        }
    }
    
    open func _defaultDispatch(action: Action) -> Any {
        guard !isDispatching else {
            raiseFatalError(
                "ReSwift:IllegalDispatchFromReducer - Reducers may not dispatch actions.")
        }
        
        isDispatching = true
        let newState = reducer(action, state)
        isDispatching = false
        state = newState
        
        return action
    }
    
    @discardableResult
    open func dispatch(_ action: Action) -> Any {
        return dispatchFunction(action)
    }
    
    @discardableResult
    open func dispatch(_ actionCreatorProvider: @escaping ActionCreator) -> Action? {
        let action = actionCreatorProvider(state, self)
        
        if let action = action {
            dispatch(action)
        }
        
        return action
    }
    
    open func dispatch(_ asyncActionCreatorProvider: @escaping AsyncActionCreator) {
        dispatch(asyncActionCreatorProvider, callback: nil)
    }
    
    open func dispatch(_ actionCreatorProvider: @escaping AsyncActionCreator,
                       callback: DispatchCallback?) {
        actionCreatorProvider(state, self) { actionProvider in
            let action = actionProvider(self.state, self)
            
            if let action = action {
                self.dispatch(action)
                callback?(self.state)
            }
        }
    }
    
  }
