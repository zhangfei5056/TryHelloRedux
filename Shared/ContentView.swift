//
//  ContentView.swift
//  HelloRedux
//
//  Created by Yuan Cao on 2024/7/29.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var store: Store

    struct Props {
        let counter: Int
        let onIncrement: () -> Void
    }

    private func map(state: State) -> Props {
        return Props(counter: state.counter) {
            store.dispatch(action: IncrementAction())
        }
    }

    var body: some View {
        VStack {
            let props = map(state: store.state)

            Text("\(props.counter)")
                .padding()

            Button("Increment") {
                props.onIncrement()
            }
        }
        .padding()
    }
}

#Preview {
    let store = Store(reducer: reducer)
    ContentView().environmentObject(store)
}
