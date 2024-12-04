//
//  Store.swift
//  HelloRedux
//
//  Created by Yuan Cao on 2024/7/29.
//

import Foundation

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State

// dispatcher will going to give us a new action
typealias Dispatcher = (_ newAction: Action) -> Void
typealias Middleware<State: ReduxState> = (_ state: State, _ action: Action, _ dispatcher: @escaping Dispatcher) -> Void

class Store<State: ReduxState>: ObservableObject {

    var reducer: Reducer<State>
    @Published var state: State
    var middlewares: [Middleware<State>]

    init(reducer: @escaping Reducer<State>, state: State, middlewares: [Middleware<State>] = []) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }

    //    func dispatch(action: Action) {
    //        self.state = reducer(self.state, action)
    //    }

    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action) // since state marked with @published, so make sure on the main queue
        }

        // run all middlewares
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}

