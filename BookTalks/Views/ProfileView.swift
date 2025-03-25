import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Profile Header
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                
                Text("User Name")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("user@email.com")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            
            // Profile Options
            List {
                Section(header: Text("Settings")) {
                    NavigationLink(destination: Text("Edit Profile")) {
                        Label("Edit Profile", systemImage: "pencil")
                    }
                    
                    NavigationLink(destination: Text("Notifications")) {
                        Label("Notifications", systemImage: "bell")
                    }
                    
                    NavigationLink(destination: Text("Privacy")) {
                        Label("Privacy", systemImage: "lock")
                    }
                }
                
                Section(header: Text("Support")) {
                    NavigationLink(destination: Text("Help Center")) {
                        Label("Help Center", systemImage: "questionmark.circle")
                    }
                    
                    NavigationLink(destination: Text("About")) {
                        Label("About", systemImage: "info.circle")
                    }
                }
                
                Section {
                    Button(action: {
                        // Handle logout
                    }) {
                        Label("Log Out", systemImage: "arrow.right.square")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .navigationTitle("Profile")
    }
} 