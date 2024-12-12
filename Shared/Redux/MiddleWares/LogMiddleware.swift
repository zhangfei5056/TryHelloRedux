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
        print("[\(DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium))] [\((#file as NSString).lastPathComponent):\(#line)] [\(#function)] - 👉\("sp")👈")
        
        print("[\(DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium))] [\((#file as NSString).lastPathComponent):\(#line)] [\(#function)] - 👉\("sdfds")👈")
        
    }
 }
