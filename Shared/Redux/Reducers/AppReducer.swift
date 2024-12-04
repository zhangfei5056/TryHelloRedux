//
//  AppReducer.swift
//  HelloRedux
//
//  Created by Yuan Cao on 2024/7/31.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.counterState = counterReducer(state.counterState, action)
    state.taskState = taskReducer(state.taskState, action)
    return state
}
