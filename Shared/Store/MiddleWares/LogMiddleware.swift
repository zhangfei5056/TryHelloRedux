//
//  LogMiddleware.swift
//  HelloRedux
//
//  Created by Yuan Cao on 2024/8/12.
//

import Foundation

func logMiddleware() -> Middleware<AppState> {
    return { state, action, dispatcher in
        print("👉\("Log Middleware")👈")
    }
 }
