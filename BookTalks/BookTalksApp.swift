//
//  BookTalksApp.swift
//  BookTalks
//
//  Created by Dmitrii Nazarov on 17.03.2025.
//

import SwiftUI
import Firebase

@main
struct BookTalksApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
