//
//  State.swift
//  HelloRedux
//
//  Created by Yuan Cao on 2024/7/31.
//

import Foundation

protocol ReduxState {}

struct CounterState: ReduxState {
    var counter: Int
}

struct AppState: ReduxState {
    var counterState: CounterState
}
