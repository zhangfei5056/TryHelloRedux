//
//  Action.swift
//  HelloRedux
//
//  Created by Yuan Cao on 2024/7/31.
//

import Foundation

protocol Action {}

struct IncrementAction: Action {}
struct DecrementAction: Action {}
struct AddAction: Action {
    let value: Int
}


struct IncrementActionAsync: Action {}
