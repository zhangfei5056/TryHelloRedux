//
//  Store.swift
//  HelloRedux
//
//  Created by Yuan Cao on 2024/7/29.
//

import Foundation

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State

class Store<State: ReduxState>: ObservableObject {

    var reducer: Reducer<State>
    @Published var state: State

    init(reducer: @escaping Reducer<State>, state: State) {
        self.reducer = reducer
        self.state = state
    }

    func dispatch(action: Action) {
        self.state = reducer(self.state, action)
    }
}
