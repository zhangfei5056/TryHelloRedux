//
//  Store.swift
//  HelloRedux
//
//  Created by Yuan Cao on 2024/7/29.
//

import Foundation

typealias Reducer = (_ state: State, _ action: Action) -> State

struct State {
    var counter: Int = 0
}

protocol Action {}

struct IncrementAction: Action {}

func reducer(_ state: State, _ action: Action) -> State {
    var state = state
    switch action {
    case _ as IncrementAction:
        state.counter += 1
    default:
        break
    }
    return state
}

class Store: ObservableObject {

    var reducer: Reducer
    @Published var state: State

    init(reducer: @escaping Reducer, state: State = State()) {
        self.reducer = reducer
        self.state = state
    }

    func dispatch(action: Action) {
        self.state = reducer(state, action)
    }
}
