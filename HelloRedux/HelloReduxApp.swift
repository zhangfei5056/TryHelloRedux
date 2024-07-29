//
//  HelloReduxApp.swift
//  HelloRedux
//
//  Created by Yuan Cao on 2024/7/29.
//
/**
 Store:
 - Initialized using a reducer and global state
 - May contain a list of middleware
 - Dispatches an action
 - Notifies listeners of state changes

 Reducer:
 - Updates the state. Reducer is the only one that can update the state
 - Updates parts or slice of the state based on the dispatched actions
 - An app can consists of multiple reducers, but in the end all reducers are joined to form a single reducer.

 State:
 - kind of ViewModel

 Actions:
 - an Enum

 */
import SwiftUI

@main
struct HelloReduxApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
