//
//  FirestoreService.swift
//  FirebaseTodoApp
//
//  Created by Tsiory Rakotoarimanana on 2025-01-17.
//

import Foundation
import FirebaseFirestore

class FirestoreService {
    private let db = Firestore.firestore() 
    
    // Add a new Todo to Firestore
    func addTodo(_ todo: Todo, completion: @escaping (Error?) -> Void) {
        do {
                   _ = try db.collection("todos").addDocument(from: todo) { error in
                       completion(error)
                   }
               } catch let error {
                   completion(error)
               }
    }
    
    
    func fetchTodos(completion: @escaping ([Todo]?, Error?) -> Void) {
        db.collection("todos").getDocuments { snapshot, error in
                   if let error = error {
                       completion(nil, error)
                       return
                   }

                   let todos = snapshot?.documents.compactMap { document -> Todo? in
                       try? document.data(as: Todo.self)
                   }
                   completion(todos, nil)
               }
    }
    
   
    func updateTodo(_ todo: Todo, completion: @escaping (Error?) -> Void) {
        guard let id = todo.id else { return }
               db.collection("todos").document(id).setData([
                   "title": todo.title,
                   "isCompleted": todo.isCompleted
               ]) { error in
                   completion(error)
               }
    }
    
    func deleteTodo(_ id: String, completion: @escaping (Error?) -> Void) {
        db.collection("todos").document(id).delete { error in
                    completion(error)
                }
        
    }
}
