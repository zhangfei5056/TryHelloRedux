//
//  IncrementMiddleware.swift
//  HelloRedux
//
//  Created by Yuan Cao on 2024/8/12.
//

import Foundation

func incrementMiddleware() -> Middleware<AppState> {
    return { state, action, dispatcher in
        switch action {
        case _ as IncrementActionAsync:
            print("👉\("start IncrementActionAsync")👈")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                dispatcher(IncrementAction())
                print("👉\("end IncrementActionAsync")👈")
            }
        default:
            break
        }
    }
}
