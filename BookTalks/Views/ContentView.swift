//
//  ContentView.swift
//  BookTalks
//
//  Created by Dmitrii Nazarov on 07.05.2025.
//
import Firebase
import FirebaseAuth
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authController: AuthController
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        if authController.isLoggedIn {
            MainTabView()
        } else {
            content
        }
    }
    
    var content: some View {
        ZStack{
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
             
            VStack(spacing: 20){
                Text("Welcome")
                    .foregroundStyle(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -100, y: -100)
//
                TextField("Email", text: $email)
                    .foregroundStyle(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundStyle(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundStyle(.white)
                
                SecureField("", text: $password)
                    .foregroundStyle(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundStyle(.white)
                            .bold()
                    }
                    
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundStyle(.white)
                
                Button {
                    authController.register(email: email, password: password)
                } label: {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing)))
                        .foregroundStyle(.white)
                }
                .padding(.top)
                .offset(y:100)
                
                Button {
                    authController.login(email: email, password: password)
                } label: {
                    Text("Already have an account? Login")
                        .bold()
                        .foregroundStyle(.white)
                }
                .padding(.top)
                .offset(y:110)

                
            }
            .frame(width: 350)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
