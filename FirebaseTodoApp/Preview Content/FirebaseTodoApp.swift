//
//  FirebaseTodoAppApp.swift
//  FirebaseTodoApp
//
//  Created by Tsiory Rakotoarimanana on 2025-01-17.
//

import SwiftUI
import Firebase
@main

struct FirebaseTodoApp: App {
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
