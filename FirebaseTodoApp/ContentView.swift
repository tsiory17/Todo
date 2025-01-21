import SwiftUI

struct ContentView: View {
    @State private var todos: [Todo] = []
    @State private var showAddTodoSheet = false
    @State private var newTodoTitle = ""
    private let firestoreService = FirestoreService()

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(todos) { todo in
                        HStack {
                            Text(todo.title)
                                .foregroundColor(todo.isCompleted ? .green : .red) // Change the text color as well
                            Spacer()
                            if todo.isCompleted {
                                Text("✓").foregroundColor(.green)
                            } else {
                                Text("✗").foregroundColor(.red)
                            }
                        }
                        .padding() // Add padding for better spacing
                        .background(todo.isCompleted ? Color.green.opacity(0.2) : Color.red.opacity(0.2)) // Apply background color to the whole HStack
                        .cornerRadius(8)
                        .onTapGesture {
                            toggleCompletionStatus(todo: todo)
                        }
                    }

                    .onDelete { indexSet in
                        deleteTodos(at: indexSet)
                    }
                }
                .onAppear {
                    loadTodos()
                }
                
                Spacer()
                
                Button("Add Todo") {
                    showAddTodoSheet.toggle()
                }
                .padding()
                .sheet(isPresented: $showAddTodoSheet) {
                    VStack {
                        // Close Button
                        HStack {
                            Spacer()
                            Button(action: {
                                showAddTodoSheet = false
                            }) {
                                Text("Close")
                                    .foregroundColor(.red)
                                    .font(.headline)
                            }
                        }
                        .padding()

                        // Title for adding a new todo
                        Text("Add New Todo")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 20)
                        
                        // TextField for entering the todo title
                        TextField("Enter todo title", text: $newTodoTitle)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 5)

                        // Save Todo Button
                        Button(action: {
                            guard !newTodoTitle.isEmpty else { return }
                            let newTodo = Todo(id: nil, title: newTodoTitle, isCompleted: false)
                            firestoreService.addTodo(newTodo) { error in
                                if let error = error {
                                    print("Error adding todo: \(error.localizedDescription)")
                                } else {
                                    loadTodos()
                                }
                                newTodoTitle = ""
                                showAddTodoSheet = false
                            }
                        }) {
                            Text("Save Todo")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(newTodoTitle.isEmpty ? Color.gray : Color.blue)
                                .cornerRadius(8)
                                .shadow(radius: 5)
                        }
                        .disabled(newTodoTitle.isEmpty)
                        .padding(.top, 20)
                    }
                    .padding()
                    .cornerRadius(16)
                    .padding()

                }
            }
            .navigationTitle("Todos")
            .navigationBarItems(trailing: EditButton())
        }
    }

    // Load Todos from Firestore
    private func loadTodos() {
        firestoreService.fetchTodos { todos, error in
            if let error = error {
                print("Error fetching todos: \(error.localizedDescription)")
            } else {
                self.todos = todos ?? []
            }
        }
    }
    
    // Toggle completion status of a todo
    private func toggleCompletionStatus(todo: Todo) {
        var updatedTodo = todo
        updatedTodo.isCompleted.toggle()
        
        // Update the todo in Firestore
        firestoreService.updateTodo(updatedTodo) { error in
            if let error = error {
                print("Error updating todo: \(error.localizedDescription)")
            } else {
                // Reload the todos after update
                loadTodos()
            }
        }
    }

    // Delete Todos
    private func deleteTodos(at offsets: IndexSet) {
        for index in offsets {
            let todo = todos[index]
            guard let id = todo.id else { return }
            
            firestoreService.deleteTodo(id) { error in
                if let error = error {
                    print("Error deleting todo: \(error.localizedDescription)")
                } else {
                    // Remove the todo from the list
                    todos.remove(at: index)
                }
            }
        }
    }
}
