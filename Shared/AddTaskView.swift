//
//  AddTaskView.swift
//  HelloRedux
//
//  Created by Yuan Cao on 2024/8/1.
//

import SwiftUI

struct Task {
    let id: UUID = UUID()
    var title: String
}

struct TaskState: ReduxState {
    var tasks: [Task]
}

struct AddTaskAction: Action {
    var task: Task
}

func taskReducer(_ state: TaskState, _ action: Action) -> TaskState {
    var state = state
    switch action {
    case let action as AddTaskAction:
        state.tasks.append(action.task)
    default:
        break
    }
    return state
}


struct AddTaskView: View {

    @EnvironmentObject var store: Store<AppState>
    @State private  var name: String = ""

    struct Props {
        // props
        let tasks: [Task]
        // dispatch
        var onTaskAdded: (Task) -> ()
    }

    private func map(state: TaskState) -> Props {
        return Props(tasks: state.tasks) { task in
            store.dispatch(action: AddTaskAction(task: task))
        }
    }


    var body: some View {

        let props = map(state: store.state.taskState)

        return VStack {
            TextField("Enter task", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Add") {
                let task = Task(title: name)
                props.onTaskAdded(task)
            }
            List(props.tasks, id: \.id) { task in
                Text(task.title)
            }

            Spacer()
        }.padding()
    }
}

#Preview {
    let store = Store(reducer: appReducer(_:_:), state: AppState(counterState: CounterState(counter: 0), taskState: TaskState(tasks: [])))
    AddTaskView().environmentObject(store)
}
