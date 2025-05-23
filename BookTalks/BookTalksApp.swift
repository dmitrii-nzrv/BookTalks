//
//  BookTalksApp.swift
//  BookTalks
//
//  Created by Dmitrii Nazarov on 17.03.2025.
//
import Firebase
import FirebaseCore
import FirebaseAuth
import SwiftUI

@main
struct BookTalksApp: App {
    @StateObject var authController = AuthController()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authController)
        }
    }
}
