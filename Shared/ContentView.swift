//
//  ContentView.swift
//  HelloRedux
//
//  Created by Yuan Cao on 2024/7/29.
//

import SwiftUI

struct ContentView: View {

    @State private var isPresented: Bool = false
    @EnvironmentObject var store: Store<AppState>

    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let onAdd: (Int) -> Void
    }

    private func map(state: CounterState) -> Props {
        return Props(counter: state.counter) {
            store.dispatch(action: IncrementAction())
        } onDecrement: {
            store.dispatch(action: DecrementAction())
        } onAdd: { addValue in
            store.dispatch(action: AddAction(value: addValue))
        }
    }

    var body: some View {
        VStack {
            let props = map(state: store.state.counterState)
            Text("\(props.counter)")
                .padding()
            Button("Increment") {
                props.onIncrement()
            }
            Button("Decrement") {
                props.onDecrement()
            }
            Button("Add") {
                props.onAdd(100)
            }
            Spacer()
            Button("Add Task") {
                isPresented = true
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $isPresented) {
            AddTaskView()
        }
    }
}

#Preview {
    let store = Store(reducer: appReducer(_:_:), state: AppState(counterState: CounterState(counter: 0), taskState: TaskState(tasks: [])))
    ContentView().environmentObject(store)
}
