//
//  CounterReducer .swift
//  HelloRedux
//
//  Created by Yuan Cao on 2024/7/29.
//

import Foundation

func counterReducer(_ state: CounterState, _ action: Action) -> CounterState {
    var state = state
    switch action {
    case _ as IncrementAction:
        state.counter += 1
    case _ as DecrementAction:
        state.counter -= 1
    case let action as AddAction: 
        state.counter += action.value
    default:
        break
    }
    print("👉current counter state:\(state)👈")
    return state
}
