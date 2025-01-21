//
//  Todo.swift
//  FirebaseTodoApp
//
//  Created by Tsiory Rakotoarimanana on 2025-01-17.
//

import Foundation
import FirebaseFirestore

struct Todo: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var isCompleted: Bool
    
 
}
